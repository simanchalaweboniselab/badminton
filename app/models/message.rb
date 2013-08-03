class Message < ActiveRecord::Base
  attr_accessible :content, :sender_id
  has_many  :receivers
  has_many :users, :through => :receivers
end
