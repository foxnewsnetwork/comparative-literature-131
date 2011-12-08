class Chapter < ActiveRecord::Base
	has_many :komas
	belongs_to :manga
end
