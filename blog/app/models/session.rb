class Session < ActiveRecord::Base	
		attr_accessor :password
  	attr_accessible :username, :password # only these fields can be set by create()
		
    validates :username, presence: true	
		validates :password, presence: true 

  # validations
  def password
    @password ||= Password.new(password_hash)
  end
  def password=(new_password)
    @password = new_password
    self.password_salt = BCrypt::Engine::generate_salt
    self.password_hash = BCrypt::Engine::hash_secret(new_password, self.password_salt)
  end
end
