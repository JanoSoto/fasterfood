class Basico < ActiveRecord::Base
	attr_accessor :tipo
	attr_accessor :cantidad
	
	has_many :detalles_basicos
	has_many :ingredientes, :through => :detalles_basicos
	accepts_nested_attributes_for :detalles_basicos
	accepts_nested_attributes_for :ingredientes


	has_many :detalle
	has_many :composicion
	has_many :compuesto, :through => :composicion
	has_many :venta, :through => :detalle
	#belongs_to :venta, :foreign_key => 'author_id'

	validates_uniqueness_of :nombre_producto, :message => "Un producto con el mismo nombre ya está registrado"
	validates :precio, :numericality => { :greater_than_or_equal_to => 0}
	validates :nombre_producto, :precio, presence: true
end
