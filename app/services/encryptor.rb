class Encryptor
  def initialize(salt)
    @salt= salt
  end

  def encrypt(text)
     Digest::SHA1.hexdigest("--#{@salt}--#{text}--")
  end
end