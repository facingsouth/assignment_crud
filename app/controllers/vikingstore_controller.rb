class VikingstoreController < ApplicationController

  def new
    @item = Item.new
  end
end
