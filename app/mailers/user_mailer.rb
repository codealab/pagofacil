class UserMailer < ActionMailer::Base
  default from: "chekoferreiro@gmail.com"
  default to: "marco.antonio.medina81@gmail.com"
  def enviar_correo(user)
  	@user = user
  	mail( :subject => "Donación", :from => user.email)
  	
  end
end
