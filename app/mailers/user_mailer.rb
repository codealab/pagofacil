class UserMailer < ActionMailer::Base
  #default from: "chekoferreiro@gmail.com"


  default to: "javier@codealab.mx"
  def enviar_correo(payment)
  	@payment = payment
  	mail( :subject => "Donación", :from => payment.email)
  end
end
