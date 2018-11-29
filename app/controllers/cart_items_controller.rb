class CartItemsController < ApplicationController

  def create()
    @user = current_user
    item = Item.find(params[:id])
    cart_item = @user.cart.cart_items.find_by(item_id: item.id) 
    if cart_item
      cart_item.quantity += 1
      cart_item.save
    else
      current_user.cart.items << item
    end
    redirect_to root_path
  end

  def update()
    cart_item = CartItem.find(params[:id])
    cart_item.quantity = params[:quantity]
    cart_item.save
    redirect_to cart_path
  end

  def destroy()
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    redirect_to cart_path
  end

end
