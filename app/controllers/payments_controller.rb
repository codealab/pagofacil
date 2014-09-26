class PaymentsController < ApplicationController

	def index
		
	end
	def new
		@payment = Payment.new
	end
	def create
		@payment = Payment.new
		
	puts 'xxxxxxxxxxxxxxxxxxxxxxxxxxx' 
    puts ">> entre a create"
    if @payment.submit(params[:payment])
    	UserMailer.enviar_correo(@payment).deliver
    	flash[:success]= "peticion lista para enviar"
     
    @datos = @payment.enviar
    
    

      render 'index'
    else
      render 'new'
    end
		
  end 
    puts 'xxxxxxxxxxxxxxxxxxxxxxxxxxx'


end



# Pruebas
# url= "https://www.pagofacil.net/st/public/Wsrtransaccion/index/format/json?method=transaccion&data[nombre]=#{@payment.nombre}&data[apellidos]=#{@payment.apellidos}&data[numeroTarjeta]=#{@payment.numero_tarjeta}&data[cvt]=#{@payment.cvt}&data[cp]=#{@payment.cp}&data[mesExpiracion]=#{@payment.mes_expiracion}&data[anyoExpiracion]=#{@payment.anyo_expiracion}&data[monto]=#{@payment.monto}&data[idSucursal]=23946b7b55a57350e661932e09121a6614d3cdaa&data[idUsuario]=239850875eeccc6448e15066fede7df24159a278&data[idServicio]=3&data[email]=#{@payment.email}&data[telefono]=#{@payment.telefono}&data[celular]=#{@payment.celular}&data[calleyNumero]=#{@payment.calle_y_numero}&data[colonia]=#{@payment.colonia}&data[municipio]=#{@payment.municipio}&data[estado]=#{@payment.estado}&data[pais]=#{@payment.pais}"

# Producción
# url= "https://www.pagofacil.net/ws/public/Wsrtransaccion/index/format/json?method=transaccion&data[nombre]=#{@payment.nombre}&data[apellidos]=#{@payment.apellidos}&data[numeroTarjeta]=#{@payment.numero_tarjeta}&data[cvt]=#{@payment.cvt}&data[cp]=#{@payment.cp}&data[mesExpiracion]=#{@payment.mes_expiracion}&data[anyoExpiracion]=#{@payment.anyo_expiracion}&data[monto]=#{@payment.monto}&data[idSucursal]=23946b7b55a57350e661932e09121a6614d3cdaa&data[idUsuario]=239850875eeccc6448e15066fede7df24159a278&data[idServicio]=3&data[email]=#{@payment.email}&data[telefono]=#{@payment.telefono}&data[celular]=#{@payment.celular}&data[calleyNumero]=#{@payment.calle_y_numero}&data[colonia]=#{@payment.colonia}&data[municipio]=#{@payment.municipio}&data[estado]=#{@payment.estado}&data[pais]=#{@payment.pais}"


=begin hash 
{"WebServices_Transacciones"=>

	{"transaccion"=>

		{"autorizado"=>"0", "transaccion"=>"n/a", "autorizacion"=>"n/a", "texto"=>"Error en las Validaciones Validaciones_Strategy_ThirdParty_ValidacionesThirdParty", 

			"error"=>{"idSucursal"=>"Sucursal 9ecd1c7a86e0e33f612bf61b0755a8393e567df3 no registrada", "numeroTarjeta"=>"'34567889' el numero de digitos no es valido", "cvt"=>"'123456' tiene más de '4' caracteres", "mesExpiracion"=>"Falta el campo: 'mesExpiracion'", "anyoExpiracion"=>"'1992' tiene más de '2' caracteres", "idUsuario"=>"idUsuario c079a5d147f7d69857bcdff096078831d6594f75 no encontrado", "telefono"=>"'123456' tiene menos de '7' caracteres"}

		, "empresa"=>"Sin determinar", "TransIni"=>"18:06:43 pm 11/09/2014", "TransFin"=>"18:06:43 pm 11/09/2014", "param1"=>"", "param2"=>"", "param3"=>"", "param4"=>"", "param5"=>"", "TipoTC"=>"", "data"=>{"nombre"=>"luis", "apellidos"=>"leon", "numeroTarjeta"=>"", "cvt"=>"", "cp"=>"123456", "mesExpiracion"=>"", "anyoExpiracion"=>"", "monto"=>"10000", "idSucursal"=>"9ecd1c7a86e0e33f612bf61b0755a8393e567df3", "idUsuario"=>"c079a5d147f7d69857bcdff096078831d6594f75", "idServicio"=>"3", "email"=>"g@gmail.com", "telefono"=>"123456", "celular"=>"1234567", "calleyNumero"=>"garibaldi 515", "colonia"=>"centro", "municipio"=>"santa fe", "estado"=>"df", "pais"=>"México", "transFechaHora"=>"1410476803", "bin"=>"345678"}
		, "dataVal"=>{"numeroTarjeta"=>"", "cvt"=>"", "anyoExpiracion"=>"", "mesExpiracion"=>"", "https"=>"on"}
		, "status"=>"success"}


	}
}
=end