# == Schema Information
#
# Table name: relationships
#
#  id          :integer(4)      not null, primary key
#  follower_id :integer(4)
#  followed_id :integer(4)
#  created_at  :datetime
#  updated_at  :datetime
#

class Relationship < ActiveRecord::Base
	attr_accessible :followed_id
	
	# Data model
	belongs_to :followed, :class_name => "User"
	belongs_to :follower, :class_name => "User"
	
	# Validations
	validates :follower_id, :presence => true
	validates :followed_id, :presence => true
end
