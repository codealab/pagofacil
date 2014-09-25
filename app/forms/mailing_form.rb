class MailingForm
	  # Rails 4: include ActiveModel::Model
  extend ActiveModel::Naming
  include ActiveModel::Conversion
  include ActiveModel::Validations
	
	validates :name, presence: true
	validates :message, presence: true
	validates :email, presence: true
	validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

	def persisted?
		false
	end

	attr_accessor :name, :email, :message

	def submit(params)
		self.name = params[:name]
		self.email = params[:email]
		self.message = params[:message]
		valid?
	end
end
