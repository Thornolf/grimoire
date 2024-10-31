class ItemsController < ApplicationController
  before_action :set_item, only: [ :edit, :update, :destroy ]

  # GET /items
  def index
    @items = Item.where(type: nil)
  end

  # GET /items/:id/edit
  def edit
    respond_to do |format|
      format.html { render partial: "form", locals: { item: @item } }
      format.turbo_stream
    end
  end

  def create
    @item = Item.new(item_params)

    if @item.save
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to items_path, notice: "Item was successfully created." }
      end
    else
      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.replace("new-item-card", partial: "items/form", formats: [ :html ], locals: { item: @item }) }
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/:id
  def update
    if @item.update(item_params)
      respond_to do |format|
        format.html { redirect_to items_path, notice: "Item updated successfully." }
        format.turbo_stream
      end
    else
      respond_to do |format|
        format.html { render :edit, status: :unprocessable_entity }
        format.turbo_stream
      end
    end
  end

  # DELETE /items/:id
  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_path, notice: "Item deleted." }
      format.turbo_stream
    end
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :description, :weight, :value, :durability, :rarity, :effect)
  end
end
