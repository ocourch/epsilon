class Song < ActiveRecord::Base
  searchkick word_start: [:title] 
  belongs_to :album
  belongs_to :user
  belongs_to :artist


  def self.to_csv(options = {})
  	CSV.generate(Hash.new) do |csv|
  		col_names = ["#", "Title", "Album", "Artist", "Timestamp"]
	    csv << col_names
	    options = options.to_a
	    options.sort! { |a,b| a[1].updated_at <=> b[1].updated_at}
	    options.each_with_index do |value, index|
	    	d = [index+1, value[1].title, Album.find(value[1].album_id).name, Artist.find(value[1].artist_id).name, value[1].updated_at]
       		csv << d
		  end
  	end
  end

end
