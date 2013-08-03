class User < ActiveRecord::Base
  attr_accessible :area_id, :auth_key, :email, :name, :password, :phone_number
  belongs_to :area
  has_many :receivers
  has_many :messages, :through => :receivers
  validates_presence_of :name, :email, :password, :phone_number, :auth_key
  validates :email, :email => true, :uniqueness => true

  #def check_auth_key(key)
  #  self.find_by_auth_key(key) ? true : false;
  #end
  def self.get_senders(messages)
    @messages = []
    messages.each do |message|
      user = self.find(message.sender_id)
      hash = {:message => message.content, :sender => user.name}
      @messages.push(hash);
    end
    @messages
  end

  def self.all_users
    @users = []
    self.all.each do |user|
      area = user.area.nil? ? "" : user.area.name
      hash = {:id => user.id, :name => user.name, :area => area}
      @users.push(hash);
    end
    @users
  end
end
