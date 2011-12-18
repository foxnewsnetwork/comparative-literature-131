# == Schema Information
#
# Table name: users
#
#  id                     :integer(4)      not null, primary key
#  email                  :string(255)     default(""), not null
#  encrypted_password     :string(128)     default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer(4)      default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#  name                   :string(255)
#  user_level             :integer(4)      default(0)
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

	# Validations
	validates :name, :email, :presence => true, :uniqueness => { :case_sensitive => false }
	validates :email, :format => { :with => /[a-zA-Z0-9\-_\."]{1,}@[a-zA-Z0-9\-_]{1,}\.[a-zA-Z0-9]{1,}/ }
	validates :password, :confirmation => true

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me
  
  # Data model for having manga
  has_many :mangas
  has_many :pictures
  
  # Data model for relationships and obsessions
  has_many :relationships, :foreign_key => "follower_id", :dependent => :destroy
  has_many :reverse_relationships, :foreign_key => "followed_id", :class_name => "Relationship", :dependent => :destroy
  has_many :obsessions, :foreign_key => "stalker_id", :dependent => :destroy
  has_many :reverse_obsessions, :foreign_key => "stalked_id", :class_name => "Obsession", :dependent => :destroy
  has_many :following, :through => :relationships, :source => :followed
  has_many :followers, :through => :reverse_relationships, :source => :follower
  has_many :stalking, :through => :obsessions, :source => :stalked
  has_many :stalkers, :through => :reverse_obsessions, :source => :stalker
  
  # Some helper functions to deal with the above relationships
  def following?(followed)
  	relationships.find_by_followed_id(followed)
  end
  
  def follow!(followed)
  	relationships.create!( :followed_id => followed )
  end
  
  def unfollow(followed)
  	relationships.find_by_followed_id(followed).destroy
  end
  
  def stalking?(stalked)
  	obsessions.find_by_stalked_id(stalked)
  end
  
  def stalk!(stalked)
  	obsessions.create!(:stalked_id => stalked)
  end
  
  def unstalk(stalked)
  	obsessions.find_by_stalked_id(stalked).destroy
  end
  
  # Administrative functions; should only be used by admin users
  def alter_user_level(user_level)
  	self.user_level = user_level
  	self.save
  end
end
