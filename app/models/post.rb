class Post < ActiveRecord::Base
  attr_accessible :author_id, :body, :recipient_id, :photo

  validates :author_id,:body, presence: true
  # validate :has_body_or_photo

  belongs_to :user,
    :class_name => "User",
    :primary_key => :id,
    :foreign_key => :author_id

  has_many :likes,
    :class_name => "Like",
    :primary_key => :id,
    :foreign_key => :post_id,
    :dependent => :destroy

  has_many :comments, 
    :class_name => "Comment",
    :primary_key => :id,
    :foreign_key => :post_id,
    :dependent => :destroy

  has_attached_file :photo, :styles => {
    :big => "400x400>",
    :small => "200x200#"
  }

  has_many :tags,
    :class_name => "Tag",
    :primary_key => :id,
    :foreign_key => :post_id,
    :dependent => :destroy

  # def has_body_or_photo 
  #   unless self.body || self.photo
  #     errors[:body] << "Need either post body or photo"
  #   end
  # end
end
