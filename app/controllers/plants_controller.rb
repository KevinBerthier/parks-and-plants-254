# frozen_string_literal: true

class PlantsController < ApplicationController
  def create
    @plant = Plant.new(plant_params)
    @garden = Garden.find(params[:garden_id])
    @plant.garden = @garden

    if @plant.save
      tag_ids = params[:plant][:tag_ids].reject { |id| id == '' }
      tag_ids.each do |tag_id|
        PlantTag.create(plant: @plant, tag_id: tag_id)
      end
      redirect_to @garden
    else
      render 'gardens/show'
    end
  end

  def destroy
    @plant = Plant.find params[:id]
    @plant.destroy
    redirect_to @plant.garden
  end

  private

  def plant_params
    params.require(:plant).permit(:name, :image_url)
  end
end
