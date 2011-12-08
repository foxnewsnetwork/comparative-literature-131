class Picture < ActiveRecord::Base
	belongs_to :koma
	belongs_to :user
end
