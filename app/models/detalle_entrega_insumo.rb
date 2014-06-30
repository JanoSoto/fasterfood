class DetalleEntregaInsumo < ActiveRecord::Base
  belongs_to :insumo
  belongs_to :entrega
end
