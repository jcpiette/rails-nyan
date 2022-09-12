require 'uri'
require 'net/http'
require 'json'

class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @notifications = Notification.where(user_id: current_user)
    @friends = UserFriend.all
    @events = Event.all
    @nunlinked_users = User.pluck(:full_name).sort
    @relations = User.pluck(:full_name).sort
    @event = Event.new
    @user_friend = UserFriend.new
    # @mysuggestions = suggestions()
  end

    # def suggestions()
    #   location = "#{current_user.latitude},#{current_user.longitude}"
    #   type = "#{current_user.preference_type}"
    #   radius = "1000"
    #   # minprice = "#{current_user.preference_budget}"
    #   # maxprice = "#{current_user.preference_budget}"
    #   # make the json
    #   url = URI("https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=#{location}&radius=#{radius}&keyword=#{type}&key=AIzaSyCSlUELYAxe0sfUJpUEJQU3TcF1OXNS-xs")
    #   https = Net::HTTP.new(url.host, url.port)
    #   https.use_ssl = true
    #   request = Net::HTTP::Get.new(url)
    #   response = https.request(request)
    #   file = response.read_body
    #   json_file = JSON.parse(file)
    #   place_ids = []  #ID OF EACH PLACE
    #   json_file['results'].each do |place|
    #     place_ids << place['place_id']
    #   end
    #   @suggestions = []  #ALL PLACE ID
    #   place_photo= []   #GET THE ID OF THE PHOTO
    #   place_ids.each_with_index do |place_id, index|
    #     url = URI("https://maps.googleapis.com/maps/api/place/details/json?place_id=#{place_id}&fields=name%2Cformatted_address%2Cgeometry%2Cprice_level%2Cadr_address%2Crating%2Ctypes%2Cphotos&key=AIzaSyCSlUELYAxe0sfUJpUEJQU3TcF1OXNS-xs")
    #     https = Net::HTTP.new(url.host, url.port)
    #     https.use_ssl = true
    #     request = Net::HTTP::Get.new(url)
    #     response = https.request(request)
    #     file = response.read_body
    #     json_file = JSON.parse(file)
    #     @photo_references = []
    #     #json_file['result']['photos'].each do |reference|
    #    #   photo_references << reference['photo_reference']
    #    # end

    #    # photo_references = []
    #     #json_file['result']['photos'].each do |reference|
    #    #   photo_url = "https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photo_reference=#{reference['photo_reference']}&key=AIzaSyCSlUELYAxe0sfUJpUEJQU3TcF1OXNS-xs"
    #     #  photo_references << photo_url
    #     #end

    #     #places_photo_reference << { 'name_photo' => [ "#{json_file['result']['name']}", "#{json_file['result']['photos'][index]['photo_reference']}"]}
    #     #@suggestions << {
    #     #  'name' => json_file['result']['name'],
    #     #  'address' => json_file['result']['formatted_address'],
    #       # 'adr_address' => json_file['result']['adr_address'],
    #     #  'price level' => json_file['result']['price_level'],
    #     #  'rating' => json_file['result']['rating'],
    #     #  'photos' => photo_references
    #    # }
    #   end
    #   @photo_references
    # end
end
