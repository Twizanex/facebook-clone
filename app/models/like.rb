class Like < ActiveRecord::Base
  attr_accessible :post_id, :user_id

  validates :post_id, :user_id, presence: true
  validates :user_id, :uniqueness => { :scope => :post_id }

  belongs_to :user,
    :class_name => "User",
    :primary_key => :id,
    :foreign_key => :user_id

  belongs_to :post,
    :class_name => "Post",
    :primary_key => :id,
    :foreign_key => :post_id

end
