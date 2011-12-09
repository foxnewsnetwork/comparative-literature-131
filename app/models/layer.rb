# == Schema Information
#
# Table name: layers
#
#  id           :integer(4)      not null, primary key
#  koma_id      :integer(4)
#  picture_id   :integer(4)
#  stack_number :integer(4)
#  created_at   :datetime
#  updated_at   :datetime
#

class Layer < ActiveRecord::Base
	belongs_to :picture, :class_name => "Picture"
	belongs_to :koma, :class_name => "Koma"
end
