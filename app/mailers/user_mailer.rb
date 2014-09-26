class UserMailer < ActionMailer::Base
  default from: "chekoferreiro@gmail.com"
  def enviar_correo(user)
  	@user = user
  	mail(:to => user.email, :subject => "hola correo de prueba")
  	
  end
end
