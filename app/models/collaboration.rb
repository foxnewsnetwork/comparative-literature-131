# == Schema Information
#
# Table name: collaborations
#
#  id              :integer(4)      not null, primary key
#  manga_id        :integer(4)
#  rank            :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#  collaborator_id :integer(4)
#

class Collaboration < ActiveRecord::Base
	belongs_to :manga, :class_name => "Manga"
	belongs_to :collaborator, :class_name => "User"
end
