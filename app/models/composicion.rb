class Composicion < ActiveRecord::Base
	belongs_to :basico
	belongs_to :compuesto
end
