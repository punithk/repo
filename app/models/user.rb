class User < ActiveRecord::Base
  has_one :profile , :dependent => :destroy
  has_many :photos , :dependent => :destroy
#  has_many :images
  attr_accessible :fname, :lname, :id
  validates :fname , presence:  true
  validates :lname , presence:  true
end
