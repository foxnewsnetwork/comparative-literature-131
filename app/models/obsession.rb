# == Schema Information
#
# Table name: obsessions
#
#  id         :integer(4)      not null, primary key
#  stalker_id :integer(4)
#  stalked_id :integer(4)
#  created_at :datetime
#  updated_at :datetime
#

class Obsession < ActiveRecord::Base
	attr_accessible :stalked_id

	# Data modeling
	belongs_to :stalker, :class_name => "User"
	belongs_to :stalked, :class_name => "User"
	
	# Validations
	validates :stalker_id, :presence => true
	validates :stalked_id, :presence => true
end
