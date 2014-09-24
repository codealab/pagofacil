class Email < ActionMailer::Base
	def send_email(contact)
		@contact = contact
		mail(:to => "marco.antonio.medina81@gmail.com", :subject => "Donación", :from => 'contacto@deceroatres.com')
	end
end