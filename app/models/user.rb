class User < ActiveRecord::Base

  has_many :articles
  has_many :comments

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  validates :password, presence: true, length: 3..20

  before_save :encrypt_password

  #def by_login_data params
  #	return if User.find_by_email(params[:email])
  #	user.salt = SecureRandom.hex
  #end

  def encrypt_password
  	self.salt = SecureRandom.hex
  	self.password = Encryptor.new(salt).encrypt(password)
  end

end
