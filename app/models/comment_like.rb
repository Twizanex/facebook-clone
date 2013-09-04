class CommentLike < ActiveRecord::Base
  attr_accessible :comment_id, :user_id

  validates :comment_id, :user_id, presence: true
  validates :comment_id, :uniqueness => { :scope => :user_id }

  belongs_to :user,
    :class_name => "User",
    :primary_key => :id,
    :foreign_key => :user_id

  belongs_to :comment,
    :class_name => "Comment",
    :primary_key => :id,
    :foreign_key => :comment_id

end
