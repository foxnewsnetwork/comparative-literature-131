class Koma < ActiveRecord::Base
	has_many :pictures
	belongs_to :chapter
end
