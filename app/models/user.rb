class User < ActiveRecord::Base
  attr_accessible :area_id, :auth_key, :email, :name, :password, :phone_number
  validates_presence_of :name, :email, :password, :phone_number, :auth_key
  validates :email, :email => true, :uniqueness => true

  #def check_auth_key(key)
  #  self.find_by_auth_key(key) ? true : false;
  #end
end
