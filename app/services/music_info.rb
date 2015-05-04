require 'json'
require 'net/http'
require_relative '../models/artist'

class MusicInfoService
	def initialize
		
	end

	def get_artists(query, limit)
		json = query_lastfm(query, get_method_snip("artist"), limit)
		artists = json["results"]["artistmatches"]["artist"]

		artist_objs = []

		artists.each do |artist|
			temp_artist = Artist.new

			temp_artist.name = artist["name"];
			temp_artist.lastfm_id = artist["mbid"]
			#temp_artist.image_url = artist["image"]

			artist_objs.push(temp_artist)
		end

		artist_objs
	end

	def get_albums(query, limit)
		json = query_lastfm(query, get_method_snip("album"), limit)
		albums = json["results"]["albummatches"]["album"]

		album_objs = []

		albums.each do |album|
			temp_album = Album.new

			temp_album.name = album["name"];
			#temp_album.lastfm_id = album["mbid"]

			album_objs.push(temp_album)
		end

		album_objs
	end

	def get_tracks(query, limit)
		json = query_lastfm(query, get_method_snip("track"), limit)
		tracks = json["results"]["trackmatches"]["track"]

		track_objs = []

		tracks.each do |track|
			temp_track = Track.new

			temp_track.name = track["name"]
			temp_track.lastfm_id = track["id"]

			track_objs.push(temp_track)
		end

		track_objs
	end

	def get_method_snip(method)
		"?method=" + method + ".search&" + method + "="
	end

	def query_lastfm(query, method_snip, limit)
		begin_snip = "http://ws.audioscrobbler.com/2.0/"
		limit_snip = "&limit=" + limit.to_s
		end_snip = "&api_key=949a97d4b7ab1cf6227269acd34f39ce&format=json"
		final_query = begin_snip + method_snip + query + limit_snip + end_snip

		http_response =  Net::HTTP.get_response(URI.parse(final_query))
		parsed_json = JSON.parse(http_response.body)

		parsed_json
	end
end
