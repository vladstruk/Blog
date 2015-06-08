module ApplicationHelper

	def sort_by_field field
      if field == params[:field]
	    params[:direction] == 'asc' ? params[:direction] = 'desc' : params[:direction] = 'asc'
	    arrow = {'asc' => '&#8593;', 'desc' => '&#8595;', nil => '&#8645;'}[params[:direction]]
	    link_to "#{field} #{arrow}".html_safe, articles_path(field: field, direction: params[:direction])
	  else
	  	link_to "#{field} #{'&#8645;'}".html_safe, articles_path(field: field, direction: params[:direction])
	  end
	end
end
