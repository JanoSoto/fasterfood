module ApplicationHelper
	def page_title(page_title)
		content_for(:page_title) { page_title }
	end
	def boton_guardar_cancelar(aceptar_btn, cancelar_url)
		html  = '<div class="btn-group">'
		#html += '<button type="submit" class="btn btn-success">Guardar</button>'
		html += aceptar_btn
		html += '<a href="' + cancelar_url + '" class="btn btn-danger">Cancelar</a>'
		html += '</div>'
		html.html_safe
	end
end
