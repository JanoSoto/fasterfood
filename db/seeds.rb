# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
["Padrone", "Sotto Padrone", "Caporegime", "Soldato", "Associato"].each do |role|
  Role.find_or_create_by(name: role)
end

Basico.delete_all

[
	{:precio => 1200, :nombre_producto => 'BEBIDA - COCA-COLA'},
	{:precio => 1200, :nombre_producto => 'BEBIDA - FANTA'},
	{:precio => 1200, :nombre_producto => 'BEBIDA - SPRITE'},
	{:precio => 1200, :nombre_producto => 'HAMBURGUESA QUESO'},
	{:precio => 1200, :nombre_producto => 'HAMBURGUESA DOBLE QUESO'},
	{:precio => 1200, :nombre_producto => 'POLLO'},
	{:precio => 1200, :nombre_producto => 'PAPAS FRITAS'},
	{:precio => 1200, :nombre_producto => 'EMPANADAS'},
].each do | basico |
	Basico.find_or_create_by(basico)
end

Compuesto.delete_all

[
	{
		:detalles => {:precio => 1200, :nombre_producto => 'COMBO 1'},
		:basicos => [
			{:precio => 1200, :nombre_producto => 'BEBIDA - SPRITE'},
			{:precio => 1200, :nombre_producto => 'POLLO'},
			{:precio => 1200, :nombre_producto => 'PAPAS FRITAS'},
			{:precio => 1200, :nombre_producto => 'EMPANADAS'},
		],
	},
	{
		:detalles => {:precio => 1200, :nombre_producto => 'COMBO 2'},
		:basicos => [
			{:precio => 1200, :nombre_producto => 'BEBIDA - SPRITE'},
			{:precio => 1200, :nombre_producto => 'HAMBURGUESA QUESO'},
		],
	},
].each do | arreglo |
	compuesto = Compuesto.new
	compuesto.precio          = arreglo[:detalles][:precio]
	compuesto.en_venta          = 1
	compuesto.nombre_producto = arreglo[:detalles][:nombre_producto]
	#compuesto.basico = Array.new
	arreglo[:basicos].each do | basico |
		
		#basico_aux = Basico.new
		#basico_aux.precio = basico[:precio]
		#basico_aux.nombre_producto = basico[:nombre_producto]

		compuesto.basico.push Basico.find_by nombre_producto: basico[:nombre_producto]
	end
	compuesto.save
end