class Email < ActionMailer::Base
	default from:  "chekoferreiro@gmail.com"

  def send_email(contact)	
		@contact = contact
  	mail( :to => contact.email, :subject => "Donacion")
  	
  end
end

