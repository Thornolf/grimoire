class InventoriesController < ApplicationController
  before_action :set_character_sheet, only: [ :new, :create, :edit, :update, :destroy ]
  before_action :set_inventory, only: [ :edit, :update, :destroy ]

  # GET /character_sheets/:character_sheet_id/inventories/new
  def new
    @inventory = @character_sheet.inventories.new
    @items = Item.all
  end

  # POST /character_sheets/:character_sheet_id/inventories
  def create
    @inventory = @character_sheet.inventories.new(inventory_params)
    if @inventory.save
      redirect_to character_sheet_path(@character_sheet), notice: "Item added to inventory."
    else
      render :new
    end
  end

  # GET /character_sheets/:character_sheet_id/inventories/:id/edit
  def edit
    @items = Item.all
  end

  # PATCH/PUT /character_sheets/:character_sheet_id/inventories/:id
  def update
    if @inventory.update(inventory_params)
      redirect_to character_sheet_path(@character_sheet), notice: "Inventory updated."
    else
      render :edit
    end
  end

  # DELETE /character_sheets/:character_sheet_id/inventories/:id
  def destroy
    @inventory.destroy
    redirect_to character_sheet_path(@character_sheet), notice: "Item removed from inventory."
  end

  private

  def set_character_sheet
    @character_sheet = CharacterSheet.find(params[:character_sheet_id])
  end

  def set_inventory
    @inventory = @character_sheet.inventories.find(params[:id])
  end

  def inventory_params
    params.permit(:item_id).merge(character_sheet_id: @character_sheet.id)
  end
end
