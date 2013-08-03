class Court < ActiveRecord::Base
  attr_accessible :address, :area_id, :name
  belongs_to :area
end
