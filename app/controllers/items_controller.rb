class ItemsController < ApplicationController
	before_action :set_product, only: [:create]
	before_action :set_quantity, only: [:create]
  before_action :set_item, only: [:destroy]

  def index
    @items = current_order.items
  end

	def create
    current_order.save
    session[:order_id] = current_order.id

    current_order.add_product_and_quantity(@product, @quantity)

    respond_to do |format|
      format.html { redirect_to items_path, notice: 'Product was successfully created.' }
    end
  end

  def destroy
    @item.destroy
    respond_to do |format|
      format.js { head :ok }
    end
  end

  private

  	def set_product
			@product = Product.find(params[:id])
  	end

  	def set_quantity
			@quantity = params[:quantity]
  	end

    def set_item
      @item = Item.find_by_product_id(params[:id])
    end

end