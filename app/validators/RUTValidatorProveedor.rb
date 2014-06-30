class RUTValidatorProveedor < ActiveModel::Validator
  require 'rut_chileno'
  def validate(record)
    unless RUT::validar(record.rut)
      record.errors[:rut_proveedor] << I18n.t(:invalid_rut)
    end
  end
end