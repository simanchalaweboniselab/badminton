class Receiver < ActiveRecord::Base
  attr_accessible :message_id, :user_id
  belongs_to :message
  belongs_to :user

  def self.create_receiver(users, message_id)
    users.each do |user|
      self.create(:user_id => user, :message_id => message_id)
    end
  end
end
