class Message < ActiveRecord::Base
  attr_accessible :body, :recipient_id, :user_id

  belongs_to :user,
    :class_name => "User",
    :primary_key => :id,
    :foreign_key => :user_id

end
