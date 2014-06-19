class Composicion < ActiveRecord::Base
	belongs_to :basico
	belongs_to :compuesto
    #accepts_nested_attributes_for :basico
end
