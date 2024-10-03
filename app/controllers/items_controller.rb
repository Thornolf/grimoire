class ItemsController < ApplicationController
  before_action :set_item, only: [ :show, :edit, :update, :destroy ]

  # GET /items
  def index
    @items = Item.where(type: nil)
  end

  # GET /items/:id
  def show
  end

  # GET /items/new
  def new
    @item = Item.new
  end

  # POST /items
  def create
    @item = Item.new(item_params)

    if @item.save
      respond_to do |format|
        format.turbo_stream  # Automatically renders a Turbo Stream response
        format.html { redirect_to items_path, notice: "Item was successfully created." }
      end
    else
      respond_to do |format|
        format.turbo_stream { render :new }
        format.html { render :new }
      end
    end
  end

  # GET /items/:id/edit
  def edit
  end

  # PATCH/PUT /items/:id
  def update
    if @item.update(item_params)
      redirect_to items_path, notice: "Item was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /items/:id
  def destroy
    @item.destroy
    redirect_to items_url, notice: "Item was successfully deleted."
  end

  private

  # Set item for actions like show, edit, update, destroy
  def set_item
    @item = Item.find(params[:id])
  end

  # Only allow trusted parameters
  def item_params
    params.require(:item).permit(:name, :description, :weight, :value, :durability, :rarity, :effect)
  end
end
