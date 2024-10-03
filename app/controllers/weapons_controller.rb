class WeaponsController < ApplicationController
  before_action :set_weapon, only: [ :show, :edit, :update, :destroy ]

  # GET /weapons
  def index
    @weapons = Weapon.all
  end

  # GET /weapons/1
  def show
  end

  # GET /weapons/new
  def new
    @weapon = Weapon.new
  end

  # GET /weapons/1/edit
  def edit
  end

  # POST /weapons
  def create
    @weapon = Weapon.new(weapon_params)

    if @weapon.save
      redirect_to weapons_path, notice: "Weapon was successfully created."
    else
      render :new
    end
  end

  # PATCH/PUT /weapons/1
  def update
    if @weapon.update(weapon_params)
      redirect_to weapons_path, notice: "Weapon was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /weapons/1
  def destroy
    @weapon.destroy
    redirect_to weapons_url, notice: "Weapon was successfully destroyed."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_weapon
    @weapon = Weapon.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def weapon_params
    params.require(:weapon).permit(:name, :skill_percentage, :base_range, :damage, :armor_piercing, :lethality_percentage, :kill_radius, :ammo)
  end
end
