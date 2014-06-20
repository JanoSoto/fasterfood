module ApplicationHelper
	def page_title(page_title)
		content_for(:page_title) { page_title }
	end
	def boton_guardar_cancelar(aceptar_btn, cancelar_url)
		html  = '<div class="btn-group">'
		#html += '<button type="submit" class="btn btn-success">Guardar</button>'
		html += aceptar_btn
		html += '<a href="' + cancelar_url + '" class="btn btn-default">Cancelar</a>'
		html += '</div>'
		html.html_safe
	end

	def anadir_active_class(controller_name)
		if params[:controller] === controller_name
			'class="active"'.html_safe
		end
	end

	def generar_menu_para(controller_name, accion_name, icon_name = 'dashboard')
		controller_name = controller_name
		if(accion_name.kind_of?(Hash))
			href = '#'
			html = '<li class="treeview">'
			    html += '<a href="#">'
			        html += '<i class="fa fa-bar-chart-o"></i>'
			        html += '<span>' + controller_name.capitalize + '</span>'
			        html += '<i class="fa fa-angle-left pull-right"></i>'
			    html += '</a>'
			    html += '<ul class="treeview-menu">'
			    	accion_name.each do | name_accion, value_accion |
						active_class = (anadir_active_class name_accion).to_s
			    		href_elemento = (url_for :controller => name_accion, :action => 'index')
			        	html += '<li ' + active_class + '><a href="' + href_elemento + '"><i class="fa fa-angle-double-right"></i> ' + name_accion.capitalize + '</a></li>'
			    	end
			    html += '</ul>'
			html += '</li>'

			html.html_safe
		else
			active_class = (anadir_active_class controller_name).to_s
			href = (url_for :controller => controller_name, :action => 'index')
			html = '<li ' + active_class + '>'
				html += '<a href="' + href + '">'
					html += '<i class="fa fa-' + icon_name + '"></i> <span>' + (controller_name.capitalize) +'</span>'
			    html += '</a>'
			html += '</li>'

			html.html_safe
		end
	end

	def si_o_no valor
		if valor
			'Si'
		else
			'No'
		end
	end
end
