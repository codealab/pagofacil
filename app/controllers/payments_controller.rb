class PaymentsController < ApplicationController

	def index
	end

	def new
		@payment = Payment.new
	end


	def create
		@payment = Payment.new
    if @payment.submit(params[:payment]) 
    	if @payment.enviar
    		render 'new'
    	else
		     flash[:success]= "Operación exitosa"
		     UserMailer.enviar_correo(@payment).deliver
		     render 'index'
		  end
    else
      render 'new'
    end
		
  end 
    puts 'xxxxxxxxxxxxxxxxxxxxxxxxxxx'


end


