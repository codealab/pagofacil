class UserMailer < ActionMailer::Base
  #default from: "chekoferreiro@gmail.com"
  default to: "marco.antonio.medina81@gmail.com"
  def enviar_correo(user)
  	@user = user
  	mail( :subject => "Donación", :from => user.email)
  	
  end

  def enviar(datos)
  	@datos = datos

    url= "https://www.pagofacil.net/ws/public/Wsrtransaccion/index/format/json?method=transaccion&data[nombre]=#{self.nombre}&data[apellidos]=#{self.apellidos}&data[numeroTarjeta]=#{self.numero_tarjeta}&data[cvt]=#{self.cvt}&data[cp]=#{self.cp}&data[mesExpiracion]=#{self.mes_expiracion}&data[anyoExpiracion]=#{self.anyo_expiracion}&data[monto]=#{self.monto}&data[idSucursal]=e84f1d3b924c07e52a8c999047373106c10e582c&data[idUsuario]=82d4a1cf37137e7147602a7e6fa64d8e6c0c0b9c&data[idServicio]=3&data[email]=#{self.email}&data[telefono]=#{self.telefono}&data[celular]=#{self.celular}&data[calleyNumero]=#{self.calle_y_numero}&data[colonia]=#{self.colonia}&data[municipio]=#{self.municipio}&data[estado]=#{self.estado}&data[pais]=#{self.pais}"

    puts "Lectura de url"

      encoded_url = URI.encode(url)
      http_request = Net::HTTP.get_response(URI.parse(encoded_url)).body
      puts ">> entre a decodificar el json"
      data = ActiveSupport::JSON.decode(http_request) #.to_json
    
    puts ">> entre a asignar data"
      self.response = data


  end

end
