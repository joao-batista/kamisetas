class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  delegate :current_user, :user_signed_in?, :to => :user_session

  helper_method :current_user, :user_signed_in?, :display_sidebar?, :current_order, :div_content_size

  def user_session 
  	UserSession.new(session) 
  end

  def require_authentication 
  	unless user_signed_in? 
  		redirect_to new_user_sessions_path, 
  		:alert => t('flash.alert.needs_login') 
  	end 
  end

	def require_no_authentication 
		redirect_to root_path if user_signed_in? 
	end

  def show_sidebar
    @display_sidebar = true
  end

  def hide_sidebar
    @display_sidebar = false
  end

  def display_sidebar?
    @display_sidebar
  end

  def div_content_size
    if display_sidebar?  
      "col-md-9" 
    else
      "col-md-12"
    end
  end

  protected

    def current_order
      if @current_order.nil? && !session[:order_id].blank?
        @current_order = Order.find_by_id(session[:order_id])
      end
      @current_order ||= Order.new
    end
	
end
