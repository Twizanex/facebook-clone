class WallPost < ActiveRecord::Base
  attr_accessible :author_id, :body, :recipient_id

  validates :author_id, :recipient_id, :body, presence: true

  belongs_to :user,
    :class_name => "User",
    :primary_key => :id,
    :foreign_key => :recipient_id

end
