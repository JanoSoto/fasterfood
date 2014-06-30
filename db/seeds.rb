# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#

Ingrediente.delete_all

[
	#carnes
	{ :nombre => 'hamburguesa de vacuno' , :categoria => 'carnes', :stock_actual => 30, :stock_critico => 20, :stock_ideal => 40},
	{ :nombre => 'vienesa' , :categoria => 'carnes', :stock_actual => 30, :stock_critico => 20, :stock_ideal => 40},
	{ :nombre => 'nugget de pollo' , :categoria => 'carnes', :stock_actual => 30, :stock_critico => 20, :stock_ideal => 40},
	{ :nombre => 'churrasco' , :categoria => 'carnes', :stock_actual => 30, :stock_critico => 20, :stock_ideal => 40},
	{ :nombre => 'pollo' , :categoria => 'carnes', :stock_actual => 30, :stock_critico => 20, :stock_ideal => 40},
	
	#lacteos
	{ :nombre => 'queso' , :categoria => 'lacteos', :stock_actual => 30, :stock_critico => 20, :stock_ideal => 40},
	
	#masas
	{ :nombre => 'pan de hamburguesa' , :categoria => 'masas', :stock_actual => 30, :stock_critico => 20, :stock_ideal => 40},
	{ :nombre => 'pan de completo' , :categoria => 'masas', :stock_actual => 30, :stock_critico => 20, :stock_ideal => 40},
	
	#verduras
	{ :nombre => 'tomate' , :categoria => 'verduras', :stock_actual => 30, :stock_critico => 20, :stock_ideal => 40},
	{ :nombre => 'palta' , :categoria => 'verduras', :stock_actual => 30, :stock_critico => 20, :stock_ideal => 40},
	{ :nombre => 'papas' , :categoria => 'verduras', :stock_actual => 30, :stock_critico => 20, :stock_ideal => 40},

	#condimentos
	{ :nombre => 'ketchup (10gr)' , :categoria => 'condimentos', :stock_actual => 30, :stock_critico => 20, :stock_ideal => 40},
	{ :nombre => 'mostaza (10gr)' , :categoria => 'condimentos', :stock_actual => 30, :stock_critico => 20, :stock_ideal => 40},
	{ :nombre => 'mayonesa (10gr)' , :categoria => 'condimentos', :stock_actual => 30, :stock_critico => 20, :stock_ideal => 40},

	#bebidas
	{ :nombre => 'sprite pequeña' , :categoria => 'bebidas', :stock_actual => 30, :stock_critico => 20, :stock_ideal => 40},
	{ :nombre => 'sprite mediana' , :categoria => 'bebidas', :stock_actual => 30, :stock_critico => 20, :stock_ideal => 40},
	{ :nombre => 'sprite grande' , :categoria => 'bebidas', :stock_actual => 30, :stock_critico => 20, :stock_ideal => 40},

	{ :nombre => 'coca-cola pequeña' , :categoria => 'bebidas', :stock_actual => 30, :stock_critico => 20, :stock_ideal => 40},
	{ :nombre => 'coca-cola mediana' , :categoria => 'bebidas', :stock_actual => 30, :stock_critico => 20, :stock_ideal => 40},
	{ :nombre => 'coca-cola grande' , :categoria => 'bebidas', :stock_actual => 30, :stock_critico => 20, :stock_ideal => 40},

	{ :nombre => 'fanta pequeña' , :categoria => 'bebidas', :stock_actual => 30, :stock_critico => 20, :stock_ideal => 40},
	{ :nombre => 'fanta mediana' , :categoria => 'bebidas', :stock_actual => 30, :stock_critico => 20, :stock_ideal => 40},
	{ :nombre => 'fanta grande' , :categoria => 'bebidas', :stock_actual => 30, :stock_critico => 20, :stock_ideal => 40},

	{ :nombre => 'kem pequeña' , :categoria => 'bebidas', :stock_actual => 30, :stock_critico => 20, :stock_ideal => 40},
	{ :nombre => 'kem mediana' , :categoria => 'bebidas', :stock_actual => 30, :stock_critico => 20, :stock_ideal => 40},
	{ :nombre => 'kem grande' , :categoria => 'bebidas', :stock_actual => 30, :stock_critico => 20, :stock_ideal => 40},
	
	#helados
	{ :nombre => 'helado (1 porcion)' , :categoria => 'helados', :stock_actual => 30, :stock_critico => 20, :stock_ideal => 40},




].each do | ingrediente |
	Ingrediente.find_or_create_by(ingrediente)
end

Basico.delete_all

[
	{
		:detalles => {:precio => 550, :nombre_producto => 'sprite pequeña'},
		:ingredientes => [ 'sprite pequeña']
	},
	{
		:detalles => {:precio => 650, :nombre_producto => 'sprite mediana'},
		:ingredientes => [ 'sprite mediana']
	},
	{
		:detalles => {:precio => 750, :nombre_producto => 'sprite grande'},
		:ingredientes => [ 'sprite grande']
	},

	{
		:detalles => {:precio => 550, :nombre_producto => 'coca-cola pequeña'},
		:ingredientes => [ 'coca-cola pequeña']
	},
	{
		:detalles => {:precio => 650, :nombre_producto => 'coca-cola mediana'},
		:ingredientes => [ 'coca-cola mediana']
	},
	{
		:detalles => {:precio => 750, :nombre_producto => 'coca-cola grande'},
		:ingredientes => [ 'coca-cola grande']
	},

	{
		:detalles => {:precio => 550, :nombre_producto => 'fanta pequeña'},
		:ingredientes => [ 'fanta pequeña']
	},
	{
		:detalles => {:precio => 650, :nombre_producto => 'fanta mediana'},
		:ingredientes => [ 'fanta mediana']
	},
	{
		:detalles => {:precio => 750, :nombre_producto => 'fanta grande'},
		:ingredientes => [ 'fanta grande']
	},

	{
		:detalles => {:precio => 550, :nombre_producto => 'kem pequeña'},
		:ingredientes => [ 'kem pequeña']
	},
	{
		:detalles => {:precio => 650, :nombre_producto => 'kem mediana'},
		:ingredientes => [ 'kem mediana']
	},
	{
		:detalles => {:precio => 750, :nombre_producto => 'kem grande'},
		:ingredientes => [ 'kem grande']
	},

	{
		:detalles => {:precio => 750, :nombre_producto => 'hamburguesa nugget'},
		:ingredientes => [ 'pan de hamburguesa', 'nugget de pollo', 'tomate', 'palta', 'mayonesa (10gr)']
	},

	{
		:detalles => {:precio => 750, :nombre_producto => 'hamburguesa italiana'},
		:ingredientes => [ 'pan de hamburguesa', 'hamburguesa de vacuno', 'tomate', 'palta', 'mayonesa (10gr)']
	},

	{
		:detalles => {:precio => 750, :nombre_producto => 'completo italiano'},
		:ingredientes => [ 'pan de completo', 'vienesa', 'tomate', 'palta', 'mayonesa (10gr)']
	},

	{
		:detalles => {:precio => 550, :nombre_producto => 'papas fritas pequeñas'},
		:ingredientes => [ 'papas']
	},

	{
		:detalles => {:precio => 750, :nombre_producto => 'papas fritas medianas'},
		:ingredientes => [ 'papas']
	},

	{
		:detalles => {:precio => 990, :nombre_producto => 'papas fritas grandes'},
		:ingredientes => [ 'papas']
	},

	{
		:detalles => {:precio => 290, :nombre_producto => 'helado pequeño'},
		:ingredientes => [ 'helado (1 porcion)']
	},
	{
		:detalles => {:precio => 450, :nombre_producto => 'helado mediano'},
		:ingredientes => [ 'helado (1 porcion)']
	},
	{
		:detalles => {:precio => 750, :nombre_producto => 'helado grande'},
		:ingredientes => [ 'helado (1 porcion)']
	},
].each do | arreglo |
	#Basico.find_or_create_by(basico)
	basico = Basico.new
	basico.precio          = arreglo[:detalles][:precio]
	basico.en_venta          = 1
	basico.nombre_producto = arreglo[:detalles][:nombre_producto]
	#compuesto.basico = Array.new
	i = 0
	if arreglo[:ingredientes]
		arreglo[:ingredientes].each do | ingrediente |
			
			#basico_aux = Basico.new
			#basico_aux.precio = basico[:precio]
			#basico_aux.nombre_producto = basico[:nombre_producto]

			basico.ingredientes.push Ingrediente.find_by nombre: ingrediente
			basico.detalles_basicos[i].cantidad = 1
			i = i + 1
		end
	end
	basico.save
end

Compuesto.delete_all

[
	{
		:detalles => {:precio => 1590, :nombre_producto => 'combo 2'},
		:basicos => [
			{:nombre_producto => 'hamburguesa nugget'},
			{:nombre_producto => 'papas fritas pequeñas'},
		],
	},
	{
		:detalles => {:precio => 1990, :nombre_producto => 'combo 3'},
		:basicos => [
			{:nombre_producto => 'hamburguesa nugget'},
			{:nombre_producto => 'papas fritas medianas'},
			{:nombre_producto => 'helado pequeño'},
		],
	},
	{
		:detalles => {:precio => 2090, :nombre_producto => 'combo 4'},
		:basicos => [
			{:nombre_producto => 'completo italiano'},
			{:nombre_producto => 'papas fritas medianas'},
			{:nombre_producto => 'helado mediano'},
		],
	},
].each do | arreglo |
	compuesto = Compuesto.new
	compuesto.precio          = arreglo[:detalles][:precio]
	compuesto.en_venta          = 1
	compuesto.nombre_producto = arreglo[:detalles][:nombre_producto]
	#compuesto.basico = Array.new
	i = 0
	arreglo[:basicos].each do | basico |
		
		#basico_aux = Basico.new
		#basico_aux.precio = basico[:precio]
		#basico_aux.nombre_producto = basico[:nombre_producto]

		compuesto.basico.push Basico.find_by nombre_producto: basico[:nombre_producto]
		compuesto.composicion[i].cantidad = 1
		i = i + 1
	end
	compuesto.save
end


Proveedor.delete_all

[
	{ :rut_proveedor => '584765461' , :nombre_proveedor => 'IDEAL', :telefono_proveedor => '24571684'},
	{ :rut_proveedor => '756468138' , :nombre_proveedor => 'CCU', :telefono_proveedor => '12348574'},
	{ :rut_proveedor => '798465465' , :nombre_proveedor => 'SUPER CERDO', :telefono_proveedor => '12341871'},
	{ :rut_proveedor => '79845465K' , :nombre_proveedor => 'JB', :telefono_proveedor => '12867492'},
	{ :rut_proveedor => '713135488' , :nombre_proveedor => 'HELLMANS', :telefono_proveedor => '27685947'},
	{ :rut_proveedor => '754654651' , :nombre_proveedor => 'MONTINA', :telefono_proveedor => '26574869'},


].each do | ingrediente |
	Proveedor.find_or_create_by(ingrediente)
end