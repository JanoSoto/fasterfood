class PrepararController < ApplicationController
  before_filter :authenticate_user!
  skip_authorization_check
  def index
    if current_user.rol != User::COCINERO
      raise CanCan::AccessDenied
    end
    @ventas = Venta.all.where(:estado_venta => [Venta::EMITIDA, Venta::PREPARANDO])
    @colores = [
      'bg-light-blue',
      'bg-aqua',
      'bg-red',
      'bg-green',
      'bg-yellow',
      'bg-purple',
      'bg-blue',
      'bg-maroon',
      'bg-navy',
    ]
    #respond_to do |format|
      #format.html { redirect_to '/venta', notice: 'Venta cancelada correctamente.'}
      #format.json { head :no_content }
    #end
  end

  def pruebas
    if current_user.rol != User::COCINERO
      raise CanCan::AccessDenied
    end
    @ventas = Venta.all.where(:estado_venta => [Venta::EMITIDA, Venta::PREPARANDO])
    @colores = [
      'bg-light-blue',
      'bg-aqua',
      'bg-red',
      'bg-green',
      'bg-yellow',
      'bg-purple',
      'bg-blue',
      'bg-maroon',
      'bg-navy',
    ]
    #respond_to do |format|
      #format.html { redirect_to '/venta', notice: 'Venta cancelada correctamente.'}
      #format.json { head :no_content }
    #end
  end

  def cambiar_estado
    if current_user.rol != User::COCINERO
      raise CanCan::AccessDenied
    end
  	id_venta = params[:id_venta]
  	tipo_producto = params[:tipo_producto]
  	id_producto = params[:id_producto]

  	venta = Venta.find(id_venta)
  	
  	if tipo_producto == 'basico'
  		producto = venta.basico.find(id_producto)
  	elsif tipo_producto == 'compuesto'
  		producto = venta.compuesto.find(id_producto)
  	end
  	
  	indice = -1
  	i = 0
  	venta.detalle.each do | detalle |
  		if tipo_producto == 'basico' and !detalle.basico.nil? and detalle.basico.id == producto.id
  			indice = i
  			break
  		elsif tipo_producto == 'compuesto' and !detalle.compuesto.nil? and detalle.compuesto.id == producto.id
  			indice = i
  			break
  		end
  		i = i + 1
  	end

  	# Todos a PREPARANDO
  	#Venta.all.each do | venta |
	  	#indice = 0
	  	#venta.detalle.each do | detalle |
			#venta.detalle[ indice ].estado = Venta::PREPARANDO
			#indice = indice + 1
		#end
	  	#venta.save
	#end
	#indice = -1

  	if indice != -1
  		venta.detalle[ indice ].estado = Venta::FINALIZADA
  		venta.save
  		#raise venta.detalle[ indice ].inspect
  		#raise 'encontre en ' + indice.to_s
  	else
  		#raise 'nada :('
  	end
  	#venta.detalle[1].compuesto.nombre_producto = 'a'

  	#venta.basicos.index()
  	respond_to do |format|
      #format.html { redirect_to venta_url, notice: 'Venta was successfully destroyed.' }
      format.html { redirect_to '/preparar' }
      format.json { head :no_content }
    end
  end
end
