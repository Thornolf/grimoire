class ConditionsController < ApplicationController
  before_action :set_condition, only: [ :edit, :update, :destroy ]

  # GET /conditions
  def index
    @conditions = Condition.all
  end

  # GET /conditions/new
  def new
    @condition = Condition.new
  end

  # POST /conditions
  def create
    @condition = Condition.new(condition_params)

    if @condition.save
      redirect_to conditions_path, notice: "Condition was successfully created."
    else
      render :new
    end
  end

  # GET /conditions/:id/edit
  def edit
  end

  # PATCH/PUT /conditions/:id
  def update
    if @condition.update(condition_params)
      redirect_to conditions_path, notice: "Condition was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /conditions/:id
  def destroy
    @condition.destroy
    redirect_to conditions_path, notice: "Condition was successfully deleted."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_condition
    @condition = Condition.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def condition_params
    params.require(:condition).permit(:name, :description, :severity, :condition_type)
  end
end
