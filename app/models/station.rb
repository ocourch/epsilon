class Station < ActiveRecord::Base
  has_and_belongs_to_many :albums
  has_and_belongs_to_many :users
  has_many :reviews, through: :users


  def self.to_csv(options = {})
  	CSV.generate(options) do |csv|
	    csv << column_names
	    options.each do |item|
	      csv << item.attributes.values_at(*column_names)
	    end
  	end
  end


end
