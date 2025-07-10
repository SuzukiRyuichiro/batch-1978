class PlantsController < ApplicationController
  def create
    # Find the garden
    @garden = Garden.find(params[:garden_id])
    # make a new plant based on strong params
    @plant = Plant.new(plant_params)
    # assign the garden
    @plant.garden = @garden
    # save the plant
    if @plant.save
      # redirect the user back to garden show
      redirect_to garden_path(@garden)
    else
      render 'gardens/show', status: :unprocessable_entity
    end
  end

  def destroy
    # Find the plant
    @plant = Plant.find(params[:id])
    # Destroy
    @plant.destroy
    # redirect back to garden show
    debugger
    redirect_to garden_path(@plant.garden)
  end

  private

  def plant_params
    params.require(:plant).permit(:name, :image_url)
  end
end
