class Song < ActiveRecord::Base
  searchkick word_start: [:title] 
  belongs_to :album
  belongs_to :user

  def self.to_csv(options = {})
  	CSV.generate(Hash.new) do |csv|
  		col_names = ["#", "Title", "Album", "Artist"]
	    csv << col_names
	    puts "************************************************************************"
	    puts options.size
	    puts "************************************************************************"
	    options.each_with_index do |(key,value),index|
	    	d = [index+1, value.title, Album.find(value.album_id).name, Artist.find(value.artist_id).name]
       		csv << d
		end
  	end
  end
end
