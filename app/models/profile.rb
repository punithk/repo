class Profile < ActiveRecord::Base
  belongs_to :user
  attr_accessible :address, :bloodgroup, :phone, :user_id, :id
  validates :address , presence:  true
  validates :bloodgroup , presence:  true
  validates :phone , presence:  true
end
