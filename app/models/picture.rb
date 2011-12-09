# == Schema Information
#
# Table name: pictures
#
#  id         :integer(4)      not null, primary key
#  user_id    :integer(4)
#  usage      :string(255)
#  extension  :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Picture < ActiveRecord::Base
	has_many :layers, :foreign_key => :picture_id, :dependent => :destroy
	has_many :komas, :through => :layers, :source => :koma
	belongs_to :user
end
