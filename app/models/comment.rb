class Comment < ActiveRecord::Base
  attr_accessible :author_id, :body, :post_id

  validates :author_id, :post_id, :body, presence: true

  belongs_to :user,
    :class_name => "User",
    :primary_key => :id,
    :foreign_key => :author_id

  belongs_to :post,
    :class_name => "Post",
    :primary_key => :id,
    :foreign_key => :post_id
end
