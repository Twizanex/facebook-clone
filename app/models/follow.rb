class Follow < ActiveRecord::Base
  attr_accessible :inbound_user_id, :outbound_user_id

  validates :inbound_user_id, :outbound_user_id, presence: true
  validates :inbound_user_id, :uniqueness => { :scope => :outbound_user_id}


  belongs_to :outbound_follower,
    :class_name => "User",
    :foreign_key => :outbound_user_id,
    :primary_key => :id

  belongs_to :inbound_follower,
    :class_name => "User",
    :foreign_key => :inbound_user_id,
    :primary_key => :id

end