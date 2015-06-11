class User < ActiveRecord::Base

  ROLES = ["admin", "moderator", "blogger"]

  has_many :articles
  has_many :comments

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  validates :password, presence: true, length: 3..20, :if => :password_changed?

  before_save :encrypt_password, :if => :password_changed?

  User::ROLES.each do |role|
    define_method("#{role}?") do
       self.role == role
     end
  end

  def self.by_login_data params
  	return unless user = User.find_by_email(params[:email])
    encrypted_password = Encryptor.new(user.salt).encrypt(params[:password])
    user if encrypted_password == user.password
  end

  def encrypt_password
  	self.salt = SecureRandom.hex
  	self.password = Encryptor.new(salt).encrypt(password)
  end

end
