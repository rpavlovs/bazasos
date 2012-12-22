# encoding: utf-8
module ApplicationHelper

	def full_title(page_title)
	  base_title = "База SOS"
	  if page_title.empty?
	    base_title
	  else
	    "#{base_title} | #{page_title}"
	  end
	end

  def format_date(date)
    date.strftime('%d.%m.%Y')
  end
end
