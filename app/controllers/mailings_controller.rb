class MailingsController < ApplicationController
	def index
	end

	def new
	@mailing = MailingForm.new
	end
	def create
	@mailing = MailingForm.new
		if @mailing.submit(params[:mailing_form])
			Email.send_email(@mailing).deliver
			flash[:success]= "Email creado exitosamente "
		end
	end
end
