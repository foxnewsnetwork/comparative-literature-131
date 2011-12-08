class Manga < ActiveRecord::Base
	has_many :chapters
	belongs_to :user
end
