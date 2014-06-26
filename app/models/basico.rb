class Basico < ActiveRecord::Base
	attr_accessor :tipo
	has_many :detalle
	has_many :composicion
	has_many :compuesto, :through => :composicion
	has_many :venta, :through => :detalle
	#belongs_to :venta, :foreign_key => 'author_id'
end
