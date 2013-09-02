class Post < ActiveRecord::Base
  attr_accessible :author_id, :body

  validates :author_id, :body, presence: true

  belongs_to :user,
    :class_name => "User",
    :primary_key => :id,
    :foreign_key => :author_id
end
