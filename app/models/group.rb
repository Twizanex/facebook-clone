class Group < ActiveRecord::Base
  attr_accessible :creator_id, :name, :description

  validates :creator_id, :name, presence: true

  has_many :group_user_joins,
    :class_name => "GroupUserJoin",
    :primary_key => :id,
    :foreign_key => :group_id

  has_many :users,
    :through => :group_user_joins,
    :source => :user


end
