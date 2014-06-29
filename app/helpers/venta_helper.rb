module VentaHelper
	def obtener_label_venta estado_venta
        estado_venta = estado_venta.to_i
		if estado_venta == Venta::CANCELADA
        	'<span class="label label-danger">Cancelada</span>'.html_safe
                    
        elsif estado_venta == Venta::EMITIDA
            '<span class="label label-warning">Emitida</span>'.html_safe
    
        elsif estado_venta == Venta::PREPARANDO
            '<span class="label label-primary">Preparando</span>'.html_safe
    
        elsif estado_venta == Venta::FINALIZADA
	    	'<span class="label label-primary">Finalizada</span>'.html_safe

        elsif estado_venta == Venta::ENTREGADA
            '<span class="label label-primary">Entregada</span>'.html_safe

	    end
	end
end
