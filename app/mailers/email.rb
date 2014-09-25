class Email < ActionMailer::Base
	
  default from: "marco.antonio.medina81@gmail.com"
  default to: "contacto@deceroatres.com"

  def send_email(contact)
  	@contact = contact

  	mail(subject: "dinativo ")
  	
  end
end

# def send_email(contact)
# @contact = contact
# mail(:to => Home.first.email, :subject => "", :from => contact.email)
# end
# end