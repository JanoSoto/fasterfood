class Detalle < ActiveRecord::Base
	belongs_to :venta
	belongs_to :basico
	belongs_to :compuesto
end
