class UserMailer < ActionMailer::Base
  #default from: "chekoferreiro@gmail.com"
  default to: "marco.antonio.medina81@gmail.com"
  def enviar_correo(payment)
  	@payment = payment
  	mail( :subject => "Donación", :from => payment.email)
  end
end
