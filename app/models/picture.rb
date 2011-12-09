class Picture < ActiveRecord::Base
	has_many :koma, :through => :layers
	belongs_to :user
end
