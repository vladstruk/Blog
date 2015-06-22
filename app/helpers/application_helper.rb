module ApplicationHelper

	def error_message field, object
	  if message = object.errors.messages[field].first
	  	"#{field.capitalize} #{message}"
	  end
	end

	def sort_by_field field
    if field == params[:field]
      direction = params[:direction] == 'asc' ? 'desc' : 'asc'
	    arrow = {'asc' => '&#8593;', 'desc' => '&#8595;'}[direction]
	    link_to "#{field} #{arrow}".html_safe, articles_path(field: field, direction: direction)
	  else
	  	link_to "#{field} #{'&#8645;'}".html_safe, articles_path(field: field, direction: 'asc')
	  end
	end

	def available_categories article
	  Category.all.map(&:name) - article.categories.map(&:name)
	end

	def rating_link article, vote
		arrow = vote == 1 ? "&#x25B2;" : "&#x25BC;"
		if article.ratings.any? { |r| r.user_id == current_user.id && r.vote == vote }
			link_to arrow.html_safe, article_ratings_path(article), method: :delete, class: "red"
		else
			link_to arrow.html_safe, article_ratings_path(article, vote: vote), method: :post
		end
	end

end
