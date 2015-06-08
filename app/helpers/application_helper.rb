module ApplicationHelper

	def sort_by_field field
      if field == params[:field]
      	#direction = { 'asc' => 'desc', 'desc' => 'asc', nil => 'asc' }[params[:direction]]
        params[:direction] == 'asc' ? direction = 'desc' : direction = 'asc'
	    arrow = {'asc' => '&#8593;', 'desc' => '&#8595;'}[direction]
	    link_to "#{field} #{arrow}".html_safe, articles_path(field: field, direction: direction)
	  else
	  	link_to "#{field} #{'&#8645;'}".html_safe, articles_path(field: field, direction: 'asc')
	  end
	end
end
