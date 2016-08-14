class User < ActiveRecord::Base

	validates :email, presence: true 
  validates :email, format: { with: /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/ } 
  validates :name, presence: true 

  has_secure_password

	before_create :generate_token

	scope :confirmed, -> { where('confirmed_at IS NOT NULL') }

	def generate_token
		self.confirmation_token = SecureRandom.urlsafe_base64
	end

	def confirm! 
		return if confirmed?
		
		self.confirmed_at = Time.current 
		self.confirmation_token = '' 
		save! 
	end

	def confirmed?
		confirmed_at.present? 
	end

	def self.authenticate(email, password)
		# se confirmed? e password != nill
  	confirmed.find_by_email(email).try(:authenticate, password)
	end

end
