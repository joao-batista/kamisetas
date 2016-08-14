class HomeController < ApplicationController
	before_filter :show_sidebar, :only => [:index, :show]
  def index
  end
end