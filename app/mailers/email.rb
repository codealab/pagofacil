class Email < ActionMailer::Base
	
  def send_email(contact)
  	
@contact = contact
  	mail( :to => 'marco.antonio.medina81@gmail.com', :subject => "Donacion", :from => contact.email)
  	
  end
end

# def send_email(contact)
# @contact = contact
# mail(:to => Home.first.email, :subject => "", :from => contact.email)
# end
# end