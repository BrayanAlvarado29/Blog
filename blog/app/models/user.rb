class User < ActiveRecord::Base
	  has_many :posts
	  validates :username, presence: true	, uniqueness: true
      validates :password, length: { minimum: 6 }      
      validates :confirmPassword, presence:  true
	  before_save { self.username = username.downcase }

	def authenticate(user)
		result = false
		unless user[:password].blank? 
			if self.password.eql?(user[:password])
				result = true 				
			end 			
		end
		result
	end		
 end

# User.create(email: "Brayan", password: 123, confirmPassword: 123).valid?
# User.create(email: nil, password: nil, confirmPassword: nil).valid?

