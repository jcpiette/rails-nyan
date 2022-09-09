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
    @event = Event.find(params[:id])
  end

  # GET /events/new
  def new
    @event = Event.new
    @users = User.all
    @suggestions = suggestions(@users)

    # redirect_to event_path
  end

   # POST /events or /events.json
  def create
    @event = Event.new
    @event.user = current_user
    params["native-select"].split(",").each do |user|
      EventMember.create(event: @event, user: User.where(full_name: user).first)
    end
    if @event.save!
      redirect_to edit_event_path(@event)
    else
      format.html { render :new, status: :unprocessable_entity }
    end
  end

  # GET /events/1/edit
  def edit
    @suggestions = suggestions(current_user)
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
    radius = '1000'
    fminprice = find_event_budget(users)
    fmaxprice = find_event_budget(users)
    minprice = fminprice.to_i
    maxprice = fmaxprice.to_i
    # make the json
    url = URI("https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=#{location}&radius=#{radius}&keyword=#{type}&minprice=#{minprice}&maxprice=#{maxprice}&key=AIzaSyCSlUELYAxe0sfUJpUEJQU3TcF1OXNS-xs")
    https = Net::HTTP.new(url.host, url.port)
    https.use_ssl = true
    request = Net::HTTP::Get.new(url)
    response = https.request(request)
    file = response.read_body
    json_file = JSON.parse(file)

    place_ids = []  #ID OF EACH PLACE
    json_file['results'].each do |place|
      place_ids << place['place_id']
    end
    @suggestions = []  #ALL PLACE ID
    place_photo = []   #GET THE ID OF THE PHOTO
    place_ids.each_with_index do |place_id, index|
      url = URI("https://maps.googleapis.com/maps/api/place/details/json?place_id=#{place_id}&fields=name%2Cformatted_address%2Cgeometry%2Cprice_level%2Cadr_address%2Crating%2Ctypes%2Cphotos%2Cwebsite&key=AIzaSyCSlUELYAxe0sfUJpUEJQU3TcF1OXNS-xs")
      https = Net::HTTP.new(url.host, url.port)
      https.use_ssl = true
      request = Net::HTTP::Get.new(url)
      response = https.request(request)
      file = response.read_body
      json_file = JSON.parse(file)
      #new_url = "https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photo_reference=#{json_file['result']['photos'].first['photo_reference']}&key=AIzaSyCSlUELYAxe0sfUJpUEJQU3TcF1OXNS-xs"
      #place_photo << new_url
      #places_photo_reference << { 'name_photo' => [ "#{json_file['result']['name']}", "#{json_file['result']['photos'][index]['photo_reference']}"]}
      @suggestions << {
        'name' => json_file['result']['name'],
        #'photo' => place_photo[index],
        'address' => json_file['result']['formatted_address'],
        'adr_address' => json_file['result']['adr_address'],
        'price level' => json_file['result']['price_level'],
        'rating' => json_file['result']['rating'],
        'location' => location,
        'website' => json_file['result']['website']
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
    test1 = budgets.map(&:to_i)
    test2 = test1.map(&:to_f)
    @budget = (test2.sum / budgets.count)
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
