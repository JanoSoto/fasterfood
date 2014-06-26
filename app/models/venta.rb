class Venta < ActiveRecord::Base
	belongs_to :user, foreign_key: "vendedor_id"
	has_many :detalle
	has_many :basico,    -> { distinct }, :through => :detalle
	has_many :compuesto, -> { distinct }, :through => :detalle

	accepts_nested_attributes_for :basico
	accepts_nested_attributes_for :compuesto
	accepts_nested_attributes_for :detalle

	CANCELADA  = 0
	EMITIDA    = 1
	PREPARANDO = 2
	FINALIZADA = 3
	ENTREGADA  = 4

	def self.estados
		{
			'CANCELADA'    => CANCELADA,
			'EMITIDA'      => EMITIDA,
			'PREPARANDO'   => PREPARANDO,
			'FINALIZADA'   => FINALIZADA,
			'ENTREGADA'    => ENTREGADA,
		}
	end
end
