class Area < ActiveRecord::Base
  attr_accessible :address, :langitude, :latitude, :name
  has_many :courts
  has_many :users
end
