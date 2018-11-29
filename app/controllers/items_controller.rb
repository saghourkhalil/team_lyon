class ItemsController < ApplicationController
  def index

    @items = Item.all


  end

  def show
  end

  def update
  
  	 @item= Item.find(params[:id])
  	 @item.picture.attach(params[:item][:picture])
  	 redirect_to "/"
    
  end
end
