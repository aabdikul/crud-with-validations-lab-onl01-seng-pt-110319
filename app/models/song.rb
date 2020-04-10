class Song < ApplicationRecord
	validates :title, presence: true 
	validates :title, uniqueness: {scope: :release_year, message: "can't create song with same name twice a year"}
	validates :release_year, numericality: { less_than_or_equal_to: 2020 }, if: :released?
	validates :artist_name, presence: true
	validates_presence_of :release_year, if: :released?

	def released?
		released == true
	end

end
