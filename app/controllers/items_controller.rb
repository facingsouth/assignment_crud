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
  
  def edit
    @item = Item.find(params[:id])
  end

  def update 
     @item = Item.find(params[:id])
    if @item.update(:title => params[:item][:title], :des => params[:item][:des], :price => params[:item][:price].to_i)
      flash[:notice] = "Item saved"
      redirect_to item_path(@item.id)
    else
      flash.now[:notice] = "Invalid input"
      render :new_item_path
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy

    redirect_to items_path, notice: 'Items was successfully deleted.'
  end



end
