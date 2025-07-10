class PlantsController < ApplicationController
  def create
    # Find the garden
    @garden = Garden.find(params[:garden_id])
    # Instantiate a plant with strong params
    @plant = Plant.new(plant_params)
    # Assign the garden to the plant
    @plant.garden = @garden
    # Save

    if @plant.save
      redirect_to garden_path(@garden)
    else
      # render
    end
  end

  def destroy
    # Finding the plant
    @plant = Plant.find(params[:id])
    # Destroy
    @plant.destroy
    # Redirect the user
    redirect_to garden_path(@plant.garden), status: :see_other
  end

  private

   def plant_params
    params.require(:plant).permit(:name, :image_url)
   end
end
