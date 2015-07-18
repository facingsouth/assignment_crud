class ItemsController < ApplicationController

  def new
    @item = Item.new
  end

  def index
    @items = Item.all
  end

  def create
    @item = Item.new(:title => params[:item][:title], :des => params[:item][:des], :price => params[:item][:price].to_i)
    if @item.save
      flash[:notice] = "Item saved"
      redirect_to item_path(@item.id)
    else
      flash.now[:notice] = "Invalid input"
      render :new_item_path
    end
  end

  def show
    @item = Item.find(params[:id])
  end


end
