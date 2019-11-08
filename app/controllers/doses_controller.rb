class DosesController < ApplicationController
  before_action :find_cocktail, only: [:create]
  before_action :find_dose, only: [:destroy]

  def create
    @dose = Dose.new(dose_params)
    # we need `cocktail_id` to associate dose with corresponding cocktail
    @dose.cocktail_id = params[:cocktail_id].to_i
    @dose.save!
    redirect_to cocktail_path(@cocktail)
  end

  def destroy
    @dose.destroy
    redirect_to cocktail_path(params[:cocktail_id])
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end

  def find_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id].to_i)
  end

  def find_dose
    @dose = Dose.find(params[:id].to_i)
  end
end
