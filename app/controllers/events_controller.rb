require 'uri'
require 'net/http'
require 'json'
class EventsController < ApplicationController
  before_action :set_event, only: %i[show edit update destroy]

  # GET /events or /events.json
  def index
    @events = Event.all
  end

  # GET /events/1 or /events/1.json
  def show
    @events = Event.all
    @event = Event.find(params[:id])
    @members = EventMember.all
    # @markers = @events.geocoded.map do |event|
    #   {
    #     lat: event.latitude,
    #     lng: event.longitude
    #   }
    # end
    @markers = [{lat: @event.latitude, lng: @event.longitude}]
  end

  # GET /events/new
  def new
    @event = Event.new
    @users = User.all
  end

  # POST /events or /events.json
  def create
    @event = Event.new
    @event.user = current_user
    params["native-select"].split(",").each do |user|
      iu = User.where(full_name: user).first
      EventMember.create(event: @event, user: iu)
      notif = Notification.create!(message: "#{current_user.full_name} has invited you to an event!", is_read: 1, user: iu)
      # NotificationChannel.broadcast_to(
      #    iu,
      #    "<div><p>#{notif.message}</p></div>".html_safe
      #  )
      # head :ok

    end
    if @event.save!
      redirect_to edit_event_path(@event)
    else
      format.html { render :new, status: :unprocessable_entity }
    end
  end

  # GET /events/1/edit
  def edit
    users = []
    @event.event_members.each do |n|
      users.push(n.user)
    end
    @suggestions = suggestions(users)
  end

  def user_suggestions
    location = [ User.find(session[:user_id].latitude, User.find(session[:user_id]).longitude)]
    type = User.find(session[:user_id]).preference_type
    minprice, maxprice = [User.find(session[:user_id]).preference_budget, User.find(session[:user_id]).preference_budget]
    radius = '500'
  end

  def suggestions(users)
    location = find_event_location(users)
    type = find_event_type(users)
    radius = '500'
    fminprice = find_event_budget(users)
    fmaxprice = find_event_budget(users)
    minprice = (fminprice.to_i - 1)
    maxprice = fmaxprice.to_i
    # make the json
    url = URI("https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=#{location}&radius=#{radius}&keyword=#{type}&minprice=#{minprice}&maxprice=#{maxprice}&key=AIzaSyDyQ-O48DeMBn0HnuDfhSUdGDXMPEEA1sM")
    https = Net::HTTP.new(url.host, url.port)
    https.use_ssl = true
    request = Net::HTTP::Get.new(url)
    response = https.request(request)
    file = response.read_body
    json_file = JSON.parse(file)
    counter = 0
    place_ids = []  #ID OF EACH PLACE
    json_file['results'].each do |place|
      if counter < 9
        counter += 1
        place_ids << place['place_id']
      end
    end
    @suggestions = []  #ALL PLACE ID
    place_photo = []   #GET THE ID OF THE PHOTO
    place_ids.each_with_index do |place_id, index|
      url = URI("https://maps.googleapis.com/maps/api/place/details/json?place_id=#{place_id}&fields=name%2Cformatted_address%2Cgeometry%2Cprice_level%2Cadr_address%2Crating%2Ctypes%2Cphotos%2Cwebsite&key=AIzaSyDyQ-O48DeMBn0HnuDfhSUdGDXMPEEA1sM")
      https = Net::HTTP.new(url.host, url.port)
      https.use_ssl = true
      request = Net::HTTP::Get.new(url)
      response = https.request(request)
      file = response.read_body
      json_file = JSON.parse(file)

      photo_references = []
      counter2 = 0
      json_file['result']['photos'].each do |reference|
        if counter2 < 2
          counter2 += 1
          photo_url = "https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photo_reference=#{reference['photo_reference']}&key=AIzaSyDyQ-O48DeMBn0HnuDfhSUdGDXMPEEA1sM"
          photo_references << photo_url
        end
      end


      @suggestions << {
        'name' => json_file['result']['name'],
        'photos' => photo_references,
        'address' => json_file['result']['formatted_address'],
        'adr_address' => json_file['result']['adr_address'],
        'price level' => json_file['result']['price_level'],
        'rating' => json_file['result']['rating'],
        'radius' => location,
        'website' => json_file['result']['website'],
        'latlng' => json_file['result']['geometry']['location']
      }
    end
    @suggestions
  end

  def find_event_type(users)
    # Outputs the most popular preference type for the users of the event
    preference_types = users.map(&:preference_type)
    frequencies = preference_types.inject(Hash.new(0)) { |h , v| h[v] += 1; h }
    @event_type = frequencies.max_by { |_k, v| v }[0]
  end

  def find_event_budget(users)
    # Outputs the average budget for the users of the event
    budgets = users.map(&:preference_budget)
    budgets_to_i = budgets.map(&:to_i)
    budgets_to_f = budgets_to_i.map(&:to_f)
    @budget = (budgets_to_f.sum / budgets.count)
  end

  def find_event_location(users)
    string_latitudes = users.map(&:latitude).map(&:to_f)
    string_longitudes = users.map(&:longitude).map(&:to_f)
    float_latitudes = string_latitudes.map(&:to_f)
    float_longitudes = string_longitudes.map(&:to_f)
    average_latitude = (float_latitudes.sum / float_latitudes.count)
    average_longitude = (float_longitudes.sum / float_longitudes.count)
    @location = "#{average_latitude.to_s},#{average_longitude.to_s}"
  end

  # PATCH/PUT /events/1 or /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to event_url(@event), notice: "Event was successfully updated." }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end



  # DELETE /events/1 or /events/1.json
  def destroy
    @event.destroy

    respond_to do |format|
      format.html { redirect_to events_url, notice: "Event was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_event
    @event = Event.find(params[:id])
  end

    # Only allow a list of trusted parameters through.
  def event_params
    params.require(:event).permit(:title, :description, :location, :event_date)
  end
end
