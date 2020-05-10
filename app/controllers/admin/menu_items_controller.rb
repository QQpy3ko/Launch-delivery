class Admin::MenuItemsController < AdminController

  before_action :set_menu_item, only: [:show, :edit, :update, :destroy]

  def index
    @menu_items = MenuItem.all
  end


  def show
  end

  def new
    @menu_item = MenuItem.new
  end

  def edit
  end

  def create
    @menu_item = MenuItem.new(menu_item_params)
    @menu_item.item_histories.build(price: @menu_item.price, active: @menu_item.active)
    @menu_item.save
    respond_to do |format|
      if @menu_item.save
        format.html { redirect_to ['admin', @menu_item], notice: 'Menu position is added.' }
      else
        format.html { render :new, notice: 'An error occurred during adding' }
      end
    end
  end

  def update
    respond_to do |format|
      if @menu_item.update(menu_item_params)
        format.html { redirect_to ['admin', @menu_item], notice: 'Menu position is added.' }
      else
        format.html { render :edit, notice: 'An error occurred during the update' }
      end
    end
  end

  def destroy
    respond_to do |format|
      if @menu_item.destroy
        format.html { redirect_to admin_menu_items_path, notice: 'Menu position is deleted.' }
      else
        format.html { render :edit, notice: 'An error occurred during deletion' }
      end
    end
  end

  private

  def set_menu_item
    @menu_item = MenuItem.find(params[:id])
  end

  def menu_item_params
    params.require(:menu_item).permit(:title, :active, :price, :category_id)
  end
end
