class Payment
  # Rails 4: include ActiveModel::Model
  include ActiveModel::Model
  extend ActiveModel::Naming
  include ActiveModel::Conversion
  include ActiveModel::Validations

  validates_presence_of :monto, :numero_tarjeta, :cvt,:mes_expiracion, :anyo_expiracion, :nombre, :apellidos, :email, :telefono, :celular, :calle_y_numero, :colonia, :cp, :municipio, :estado
  validates_numericality_of  :monto, :numero_tarjeta, :cvt, :mes_expiracion, :anyo_expiracion, :telefono, :celular, :cp



  
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  
   validates_numericality_of :monto,  {:greater_than_or_equal_to => 1 , message: " debe ser mayor o igual a $100 pesos"}
  

  validates :numero_tarjeta, length: {
    minimum: 16,
    maximum: 16,
   
    too_long: "%{value} es demasiado largo (mínimo %{count} caracteres)",
    too_short: "%{value} es demasiado corto (mínimo %{count} caracteres)"
  }
  validates :cvt, length: {
    minimum: 3,
    maximum: 4,
   
    too_long: "   es demasiado largo (mínimo %{count} caracteres)",
    too_short: "  es demasiado corto (mínimo %{count} caracteres)"
  }

  
  validates :mes_expiracion, length: {
    minimum: 2,
    maximum: 2,
   
    too_long: " debe ser %{count} digitos",
    too_short: " debe ser %{count} digitos"
  }
  validates :anyo_expiracion, length: {
    minimum: 2,
    maximum: 2,
   
    too_long: " debe ser %{count} digitos",
    too_short: " debe ser %{count} digitos"
  }

  

  validates :celular, length: {
    minimum: 10,
    maximum: 10,
   
    too_long: " %{value}  es demasiado largo (mínimo %{count} caracteres)",
    too_short: "%{value}  es demasiado corto (mínimo %{count} caracteres)"
  }
  validates :telefono, length: {
    minimum: 10,
    maximum: 10,
   
    too_long: "%{value}  es demasiado largo (mínimo %{count} caracteres) ",
    too_short: "%{value} es demasiado corto (mínimo %{count} caracteres)"
  }

validates :cp, length: {
  maximum: 9,
  too_long: "%{value}  es demasiado largo (mínimo %{count} caracteres) "

}


  attr_accessor  :nombre, :apellidos, :numero_tarjeta, :cp, :cvt, :monto, :mes_expiracion, :anyo_expiracion, :email, :telefono, :celular, :calle_y_numero, :colonia, :municipio, :estado, :pais, :response, :pago_facil_errors

  def persisted?
    false
  end

  def submit(params)
    self.nombre = params[:nombre]
    self.apellidos = params[:apellidos]
    self.numero_tarjeta = params[:numero_tarjeta]
    self.cp = params[:cp]
    self.cvt = params[:cvt]
    self.monto = params[:monto]
    self.mes_expiracion = params[:mes_expiracion]
    self.anyo_expiracion = params[:anyo_expiracion]
    self.email = params[:email]
    self.telefono = params[:telefono]
    self.celular = params[:celular]
    self.calle_y_numero = params[:calle_y_numero]
    self.colonia = params[:colonia]
    self.municipio = params[:municipio]
    self.estado = params[:estado]
    self.pais = "Mexico"

     valid?

  end

  
  def enviar
    url= "https://www.pagofacil.net/st/public/Wsrtransaccion/index/format/json?method=transaccion&data[nombre]=#{self.nombre}&data[apellidos]=#{self.apellidos}&data[numeroTarjeta]=#{self.numero_tarjeta}&data[cvt]=#{self.cvt}&data[cp]=#{self.cp}&data[mesExpiracion]=#{self.mes_expiracion}&data[anyoExpiracion]=#{self.anyo_expiracion}&data[monto]=#{self.monto}&data[idSucursal]=e84f1d3b924c07e52a8c999047373106c10e582c&data[idUsuario]=82d4a1cf37137e7147602a7e6fa64d8e6c0c0b9c&data[idServicio]=3&data[email]=#{self.email}&data[telefono]=#{self.telefono}&data[celular]=#{self.celular}&data[calleyNumero]=#{self.calle_y_numero}&data[colonia]=#{self.colonia}&data[municipio]=#{self.municipio}&data[estado]=#{self.estado}&data[pais]=#{self.pais}"

    puts "Lectura de url"

      encoded_url = URI.encode(url)
      http_request = Net::HTTP.get_response(URI.parse(encoded_url)).body
      data = ActiveSupport::JSON.decode(http_request) #.to_json
      self.response = data
      puts "Esto es el valor de DATA xxxxxxxxxxxxxxxxxxxxxxxxx"
      puts data

      puts "Esto es el valor de ERROR xxxxxxxxxxxxxxxxxxxxxxxxx"
      puts data["WebServices_Transacciones"]["transaccion"]["error"]

      if data["WebServices_Transacciones"]["transaccion"]["error"]
        self.pago_facil_errors = data["WebServices_Transacciones"]["transaccion"]["error"]
      else
        self.pago_facil_errors = false
      end

      puts "Esto es el valor de Autorizado xxxxxxxxxxxxxxxxxxxxxxxxx"
      puts data["WebServices_Transacciones"]["transaccion"]["autorizado"] == "1"

      data["WebServices_Transacciones"]["transaccion"]["autorizado"] == "1"
  end

end

# Producción
# url= "https://www.pagofacil.net/ws/public/Wsrtransaccion/index/format/json?method=transaccion&data[nombre]=#{@payment.nombre}&data[apellidos]=#{@payment.apellidos}&data[numeroTarjeta]=#{@payment.numero_tarjeta}&data[cvt]=#{@payment.cvt}&data[cp]=#{@payment.cp}&data[mesExpiracion]=#{@payment.mes_expiracion}&data[anyoExpiracion]=#{@payment.anyo_expiracion}&data[monto]=#{@payment.monto}&data[idSucursal]=23946b7b55a57350e661932e09121a6614d3cdaa&data[idUsuario]=239850875eeccc6448e15066fede7df24159a278&data[idServicio]=3&data[email]=#{@payment.email}&data[telefono]=#{@payment.telefono}&data[celular]=#{@payment.celular}&data[calleyNumero]=#{@payment.calle_y_numero}&data[colonia]=#{@payment.colonia}&data[municipio]=#{@payment.municipio}&data[estado]=#{@payment.estado}&data[pais]=#{@payment.pais}"

# Pruebas
# url= "https://www.pagofacil.net/st/public/Wsrtransaccion/index/format/json?method=transaccion&data[nombre]=#{self.nombre}&data[apellidos]=#{self.apellidos}&data[numeroTarjeta]=#{self.numero_tarjeta}&data[cvt]=#{self.cvt}&data[cp]=#{self.cp}&data[mesExpiracion]=#{self.mes_expiracion}&data[anyoExpiracion]=#{self.anyo_expiracion}&data[monto]=#{self.monto}&data[idSucursal]=e84f1d3b924c07e52a8c999047373106c10e582c&data[idUsuario]=82d4a1cf37137e7147602a7e6fa64d8e6c0c0b9c&data[idServicio]=3&data[email]=#{self.email}&data[telefono]=#{self.telefono}&data[celular]=#{self.celular}&data[calleyNumero]=#{self.calle_y_numero}&data[colonia]=#{self.colonia}&data[municipio]=#{self.municipio}&data[estado]=#{self.estado}&data[pais]=#{self.pais}"

