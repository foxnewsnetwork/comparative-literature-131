# == Schema Information
#
# Table name: pictures
#
#  id               :integer(4)      not null, primary key
#  user_id          :integer(4)
#  usage            :string(255)
#  extension        :string(255)
#  created_at       :datetime
#  updated_at       :datetime
#  pic_file_name    :string(255)
#  pic_content_type :string(255)
#  pic_file_size    :integer(4)
#  pic_updated_at   :datetime
#  width            :integer(4)
#  height           :integer(4)
#

class Picture < ActiveRecord::Base
	has_many :layers, :foreign_key => :picture_id, :dependent => :destroy
	has_many :komas, :through => :layers, :source => :koma
	belongs_to :user
	
	# Paperclip usage
	has_attached_file :pic, :style => { :small => "150x150>" , :thumb => "100x100#"}
	validates_attachment_presence :pic
	validates_attachment_size :pic, :less_than => 2.megabytes
	validates_attachment_content_type :pic, :content_type => [ "image/png"]
end
