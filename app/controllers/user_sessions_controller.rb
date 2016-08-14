class UserSessionsController < ApplicationController 
	before_filter :require_no_authentication, :only => [:new, :create]
	before_filter :require_authentication, :only => :destroy
	
	def new 
		@session = UserSession.new(session)
	end
	
	def create 
		@session = UserSession.new(session, params[:user_session]) 
		respond_to do |format|
			if @session.authenticate 
				format.html { redirect_to root_path, :notice => t('flash.notice.signed_in') }
				# 200 ok
				format.js { render :success, status: 200 }
			else 
				format.html { render :new }
				# 401 Unauthorized - exibe erro no console
				# 403 Forbidden - exibe erro no console
				# 203 Non-Authoritative Information - não exibe erro no console
				format.js { render :error, status: 203  }
			end
		end 
	end
	
	def destroy 
		user_session.destroy 
		redirect_to root_path, :notice => t('flash.notice.signed_out')  
	end 

end 