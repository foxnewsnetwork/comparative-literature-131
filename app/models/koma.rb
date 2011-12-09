class Koma < ActiveRecord::Base
	has_many :pictures, :through => :layers
	belongs_to :chapter
end
