require "./app/models/album"
#require "./lib/music_info"
require 'pry'

class LastFmSearchController < ApplicationController

  respond_to :json

  def search
  end

  def display
   result_limit = 10
   limit_snip = "&limit=" + result_limit.to_s

   begin_snip = "http://ws.audioscrobbler.com/2.0/"

   artist_snip = "?method=artist.search&artist="
   album_snip = "?method=album.search&album="
   track_snip = "?method=track.search&track="

   end_snip = params[:query] + limit_snip + "&api_key=949a97d4b7ab1cf6227269acd34f39ce&format=json"

   artist_search_URI = begin_snip + artist_snip + end_snip
   album_search_URI = begin_snip + album_snip + end_snip
   track_search_URI = begin_snip + track_snip + end_snip

   artist_response = Net::HTTP.get_response(URI.parse(artist_search_URI))
   album_response = Net::HTTP.get_response(URI.parse(album_search_URI))
   track_response = Net::HTTP.get_response(URI.parse(track_search_URI))

   artist_parsed_json = JSON.parse(artist_response.body)
   album_parsed_json = JSON.parse(album_response.body)
   track_parsed_json = JSON.parse(track_response.body)

   @artists = artist_parsed_json["results"]["artistmatches"]["artist"]
   @albums = album_parsed_json["results"]["albummatches"]["album"]
   @tracks = track_parsed_json["results"]["trackmatches"]["track"]

   @query = params[:query]
 end

 def add_album
  #render text: params
     #Album.create(name: first_album["name"])
     #Artist.create(name: first_album["artist"])
     #album_create_status = Album.find_or_create_by(lastfm_id: params[:album_id])

     #temp_album = Album.new

     artist_name = params[:album_artist]
     album_name = params[:album_name]
     lastfm_id = params[:album_id]

     this_artist = Artist.find_or_create_by(name: artist_name)

     this_album = Album.find_or_create_by(artist_id: this_artist.id, name: album_name)


    tracks_URI =  "http://ws.audioscrobbler.com/2.0/?method=album.getinfo&api_key=949a97d4b7ab1cf6227269acd34f39ce&artist=" + artist_name + "&album=" + album_name + "&format=json"
    tracks_response = Net::HTTP.get_response(URI.parse(tracks_URI))
    tracks_json = JSON.parse(tracks_response.body)

    tracks = tracks_json["album"]["tracks"]["track"]

    tracks.each do |track|
      name = track["name"]
      duration = track["duration"]
      this_track = Song.find_or_create_by(title: name, duration: duration, artist_id: this_artist.id, artist_name: artist_name ,album_id: this_album.id)

    end


     #temp_album.lastfm_id = params[:lastfm_id][0]
     #temp_album.name = params[:album_name][0]

     #temp_album.save


     #Album.find_or_create_by(lastfm_id: params[:lastfm_id][0])
 end

 def run_tests
    mis = MusicInfoService.new

    @output = mis.get_artists("Watsky", 2)
 end
end