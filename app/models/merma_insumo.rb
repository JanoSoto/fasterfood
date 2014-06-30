class MermaInsumo < ActiveRecord::Base
  belongs_to :insumo
  validates :cantidad_merma, :numericality => { :greater_than_or_equal_to => 0}
  validates :cantidad_merma, presence: true
  validate :fecha_debe_ser_menor_a_hoy
  validate :insumo_debe_existir
  
  def fecha_debe_ser_menor_a_hoy
    if fecha_merma.present? && fecha_merma > Date.today
      errors.add(:general, "La fecha no puede ser en el futuro")
    end
  end

  def insumo_debe_existir
    if Insumo.where(id: insumo_id).empty?
      errors.add(:general, "El insumo seleccionado no existe")
    end
  end
end
