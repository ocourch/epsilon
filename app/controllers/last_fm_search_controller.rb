class LastFmSearchController < ApplicationController

  respond_to :json
  $apiURI = "http://ws.audioscrobbler.com/2.0/?method=album.search&album=6's&api_key=949a97d4b7ab1cf6227269acd34f39ce&format=json"

  def search
  	response = Net::HTTP.get_response(URI.parse($apiURI))
  	data = response.body
  	JSON.parse(data)

  	render :text => JSON.parse(data)
  end

  def display
  	response = Net::HTTP.get_response(URI.parse($apiURI))
  	data = response.body
  	JSON.parse(data)

  	parsed_json = JSON.parse(data)

  	album = parsed_json["results"]["albummatches"]["album"].first

  	@album_name = album["name"]
  	@album_artist = album["artist"]
  	@album_image_small = album["image"][2]["#text"]
  end
end
