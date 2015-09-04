class Image < ActiveRecord::Base
  belongs_to :user
  attr_accessible :url
end
