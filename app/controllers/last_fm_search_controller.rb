require "./app/models/album"

class LastFmSearchController < ApplicationController

  respond_to :json

  def search
  end

  def display
	$apiURI = "http://ws.audioscrobbler.com/2.0/?method=album.search&album=" + params[:query] + "&api_key=949a97d4b7ab1cf6227269acd34f39ce&format=json"

  	response = Net::HTTP.get_response(URI.parse($apiURI))
  	data = response.body

  	parsed_json = JSON.parse(data)

  	@albums = parsed_json["results"]["albummatches"]["album"]

  	first_album = @albums[0]

  	#Album.create
  end


end
