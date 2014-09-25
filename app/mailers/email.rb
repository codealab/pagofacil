class Email < ActionMailer::Base
	default :from => contact.email
  

  def send_email(contact)
  	
@contact = contact
  	mail( :to => 'marco.antonio.medina81@gmail.com', :subject => "Donacion")
  	
  end
end

# def send_email(contact)
# @contact = contact
# mail(:to => Home.first.email, :subject => "", :from => contact.email)
# end
# end