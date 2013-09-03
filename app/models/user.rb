class User < ActiveRecord::Base
  attr_accessible :username, :password
  attr_reader :password

  validates :password_digest, :presence => { :message => "Password can't be blank" }
  validates :password, :length => { :minimum => 6, :allow_nil => true }
  validates :session_token, :presence => true
  validates :username, :presence => true

  after_initialize :ensure_session_token

  has_many :posts,
    :class_name => "Post",
    :primary_key => :id,
    :foreign_key => :author_id

  has_many :inbound_follows,
    :class_name => "Follow",
    :primary_key => :id,
    :foreign_key => :outbound_user_id

  has_many :outbound_follows,
    :class_name => "Follow",
    :primary_key => :id,
    :foreign_key => :inbound_user_id

  has_many :outbound_followers,
    :through => :inbound_follows,
    :source => :inbound_follower

  has_many :inbound_followers,
    :through => :outbound_follows,
    :source => :outbound_follower

  has_many :likes,
    :class_name => "Like",
    :primary_key => :id,
    :foreign_key => :user_id


  def self.find_by_credentials(username, password)
    user = User.find_by_username(username)

    return nil if user.nil?

    user.is_password?(password) ? user : nil
  end

  def self.generate_session_token
    SecureRandom::urlsafe_base64(16)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def reset_session_token!
    self.session_token = self.class.generate_session_token
    self.save!
  end

  private
  def ensure_session_token
    self.session_token ||= self.class.generate_session_token
  end
end