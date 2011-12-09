# == Schema Information
#
# Table name: mangas
#
#  id         :integer(4)      not null, primary key
#  user_id    :integer(4)
#  title      :string(255)
#  summary    :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Manga < ActiveRecord::Base
	has_many :chapters
	has_many :collaboration, :foreign_key => :manga_id, :dependent => :destroy
	has_many :collaborators, :through => :collaboration, :source =>  :collaborator
	belongs_to :user
end
