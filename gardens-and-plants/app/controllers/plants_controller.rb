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
      render 'gardens/show', status: :unprocessable_entity

      # We need to specify that we want the show.html.erb under gardens folder to render.
      # It is because by default, when you say render :show, Rails would try to find a file
      # that has the name `show` inside the `plants` folder, because we are in PlantsController
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
