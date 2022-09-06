require 'uri'
require 'net/http'
require 'json'
class EventsController < ApplicationController
  before_action :set_event, only: %i[ show edit update destroy ]

  # GET /events or /events.json
  def index
    @events = Event.all
  end

  # GET /events/1 or /events/1.json
  def show
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  def suggestions
    location = find_event_location()

    type = 'restaurant'
    radius = '1500'
    fminprice = find_event_budget()
    fmaxprice = find_event_budget()
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

    place_ids = []
    json_file['results'].each do |place|
      place_ids << place['place_id']
    end
    @suggestions = []
    place_ids.each do |place_id|
      newurl = URI("https://maps.googleapis.com/maps/api/place/details/json?place_id=#{place_id}&fields=name%2Cformatted_address%2Cgeometry%2Cprice_level%2Cadr_address%2Crating%2Ctypes&key=AIzaSyCSlUELYAxe0sfUJpUEJQU3TcF1OXNS-xs")
      new_https = Net::HTTP.new(newurl.host, newurl.port)
      new_https.use_ssl = true
      new_request = Net::HTTP::Get.new(newurl)
      response = new_https.request(new_request)
      new_file = response.read_body
      json_file = JSON.parse(new_file)
      @suggestions << place_hash = {
        'name' => json_file['result']['name'],
       #'address' => json_file['result']['formatted_address'],
       # 'adr_address' => json_file['result']['adr_address'],
        'price level' => json_file['result']['price_level'],
       # 'rating' => json_file['result']['rating'],
      }
    end
    @suggestions
  end

  def suggestions_attempt
    radius = '1000'
    #type = find_event_type()
    #min_budget = find_event_budget()
    #max_budget = find_event_budget()
    #location = find_event_location()
    places_id = find_places(location, radius, type, min_budget, max_budget) #places each id of a match in an array
    @suggestions = []
    places_id.each do |place|
      suggestions << get_info(place) #places a hash of info for each id into an array
    end
    @suggestions
  end

  def make_json(url)
    https = Net::HTTP.new(url.host, url.port)
    https.use_ssl = true
    request = Net::HTTP::Get.new(url)
    response = https.request(request)
    file = response.read_body
    json_file = JSON.parse(file)
    return json_file
  end

  def find_places(location, radius, type, min_budget, max_budget)
    id_array = []
    url = URI("https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=#{location}&radius=#{radius}&keyword=#{type}&minprice=#{min_budget}maxprice=#{max_budget}&key=AIzaSyCSlUELYAxe0sfUJpUEJQU3TcF1OXNS-xs")
    json_file = make_json(url)
    json_file['results'].each do |place|
      id_array << place['place_id']
    end
    id_array
  end

  def get_info(id)
    url = URI("https://maps.googleapis.com/maps/api/place/details/json?place_id=#{id}&fields=name%2Cformatted_address%2Cgeometry%2Cprice_level%2Cadr_address%2Crating%2Ctypes&key=AIzaSyCSlUELYAxe0sfUJpUEJQU3TcF1OXNS-xs")
    puts url
    json_file = make_json(url)
    place_hash = {
      'name' => json_file['result']['name'],
      #'address' => json_file['result']['formatted_address'],
      #'adr_address' => json_file['result']['adr_address'],
      'price level' => json_file['result']['price_level'],
      'rating' => json_file['result']['rating'],
    }
    place_hash
  end

  def find_event_type
    # Outputs the most popular preference type for the users of the event
    preference_types = Event.find(1).users.map(&:preference_type)
    frequencies = preference_types.inject(Hash.new(0)) { |h , v| h[v] += 1; h }
    @event_type = frequencies.max_by { |_k, v| v }[0]
  end

  def find_event_budget
    # Outputs the average budget for the users of the event
    budgets = Event.find(1).users.map(&:preference_budget)
    test1 = budgets.map(&:to_i)
    test2 = test1.map(&:to_f)
    @budget = (test2.sum / budgets.count)
  end

  def find_event_location
    string_latitudes = Event.find(1).users.map(&:latitude).map(&:to_f)
    string_longitudes = Event.find(1).users.map(&:longitude).map(&:to_f)
    float_latitudes = string_latitudes.map(&:to_f)
    float_longitudes = string_longitudes.map(&:to_f)
    average_latitude = (float_latitudes.sum / float_latitudes.count)
    average_longitude = (float_longitudes.sum / float_longitudes.count)
    @location = "#{average_latitude.to_s},#{average_longitude.to_s}"
  end

 # POST /events or /events.json
  def create
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to event_url(@event), notice: "Event was successfully created." }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
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
      params.require(:event).permit(:title, :description, :location, :event_date, :user_id)
    end
end
