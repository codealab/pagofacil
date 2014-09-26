class MailingsController < ApplicationController
	def index
	end

	def new
	@mailing = MailingForm.new
	end
	def create
		@mailing = MailingForm.new
		if @mailing.submit(params[:mailing_form])
	 			Email.send_amail(@mailing).deliver

		end
	end
end
