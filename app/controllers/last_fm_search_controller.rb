require "./app/models/album"

class LastFmSearchController < ApplicationController

  respond_to :json

  def search
  end

  def display
   $albumSearchURI = "http://ws.audioscrobbler.com/2.0/?method=album.search&album=" + params[:query] + "&api_key=949a97d4b7ab1cf6227269acd34f39ce&format=json"
   $artistSearchURI = "http://ws.audioscrobbler.com/2.0/?method=artist.search&artist=" + params[:query] + "&api_key=949a97d4b7ab1cf6227269acd34f39ce&format=json"
   $trackSearchURI = "http://ws.audioscrobbler.com/2.0/?method=track.search&track=" + params[:query] + "&api_key=949a97d4b7ab1cf6227269acd34f39ce&format=json"

   album_response = Net::HTTP.get_response(URI.parse($albumSearchURI))
   #artist_response = Net::HTPP.get_response(URI.parse($artistSearchURI))
   #track_response = Net::HTPP.get_response(URI.parse($trackSearchURI))

   album_data = album_response.body
   #artist_data = artist_response.body
   #track_data = track_response.body

   album_parsed_json = JSON.parse(album_data)
   #artist_parsed_json = JSON.parse(artist_data)
   #track_parsed_json = JSON.parse(track_data)

   @albums = album_parsed_json["results"]["albummatches"]["album"]

   if @albums
     first_album = @albums[0]

     #render text: first_album

     Album.create(name: first_album["name"])
     Artist.create(artist: first_album["artist"])
   end
 end
end