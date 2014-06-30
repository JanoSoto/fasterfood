class MermaIngrediente < ActiveRecord::Base
  belongs_to :ingrediente
  validates :cantidad, :numericality => { :greater_than_or_equal_to => 0}
  validates :cantidad, presence: true
  validate :fecha_debe_ser_menor_a_hoy
  validate :ingrediente_debe_existir
  
  def fecha_debe_ser_menor_a_hoy
    if fecha_merma.present? && fecha_merma > Date.today
      errors.add(:general, "La fecha no puede ser en el futuro")
    end
  end

  def ingrediente_debe_existir
    if Ingrediente.where(id: ingrediente_id).empty?
      errors.add(:general, "El ingrediente seleccionado no existe")
    end
  end
end
