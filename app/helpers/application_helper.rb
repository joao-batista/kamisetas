module ApplicationHelper
	def error_tag(model, attribute) 
    if model.errors.has_key? attribute 
      content_tag :div, model.errors[attribute].first, :class => 'error_message' 
    end 
  end

  def categories
  	Category.all
  end

  def sizes
    Size.all
  end

  def precos
	  precos = [
	    ["1", "20"],
	    ["2", "20 a 40"],
	    ["3", "40 a 50"],
	    ["4", "50 a 70"],
	    ["5", "70 a 90"]
	  ]
  end

end
