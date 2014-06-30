class RUTValidatorProveedor < ActiveModel::Validator
  require 'rut_chileno'
  def validate(record)
    if !RUT::validar(record.rut_proveedor) and record.rut_proveedor.strip.downcase != ''
      record.errors[:rut_proveedor] << I18n.t(:invalid_rut)
    end
  end
end