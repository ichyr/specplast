module VisitorsHelper
	def sortable column, title = nil
		column = column.to_s
	  title ||= column.titleize
	  css_class = column == sort_column ? "current #{sort_direction}" : nil
	  direction = ( column == sort_column && sort_direction == "asc" ) ? "desc" : "asc"

	  title = sort_glyph(title, css_class).html_safe
	  link_to title, params.merge(sort: column, direction: direction, :page => nil), 
	  							 { class: css_class }
	end

	def sort_glyph title, css_class
		if css_class 
			title += " <span class='glyphicon glyphicon-chevron-down'></span>" if sort_direction == "desc"
			title += " <span class='glyphicon glyphicon-chevron-up'></span>" if sort_direction == "asc"
		end
		title
	end

	def multi_word_id_trasnform(id)
		id.split(' ').join('_')
	end
end
