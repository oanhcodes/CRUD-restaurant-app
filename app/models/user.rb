class User < ActiveRecord::Base
  has_many :reviews, :foreign_key => :reviewer_id
  has_many :restaurants, :foreign_key => :creator_id

  validates_presence_of :email, :password
  validates_uniqueness_of :email

  def password
    @password ||= BCrypt::Password.new(hashed_password)
  end

  def password=(plaintext_password)
    @password ||= BCrypt::Password.create(plaintext_password)
    self.hashed_password = @password
  end

  def authenticate(plaintext_password)
    self.password == plaintext_password
  end
end
