# == Schema Information
#
# Table name: komas
#
#  id         :integer(4)      not null, primary key
#  chapter_id :integer(4)
#  created_at :datetime
#  updated_at :datetime
#  width      :integer(4)
#  height     :integer(4)
#

class Koma < ActiveRecord::Base
	has_many :layers, :foreign_key => :koma_id, :dependent => :destroy
	has_many :pictures, :through => :layers, :source => :picture
	belongs_to :chapter
end
