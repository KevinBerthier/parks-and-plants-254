# frozen_string_literal: true

class PlantTagsController < ApplicationController
  def new
    @plant = Plant.find(params[:plant_id])
    @plant_tag = PlantTag.new
  end

  def create
    @plant = Plant.find(params[:plant_id])
    @plant_tag = PlantTag.new(plant_tag_params)
    @plant_tag.plant = @plant
    if @plant_tag.save
      redirect_to @plant.garden
    else
      render :new
    end
  end

  private

  def plant_tag_params
    params.require(:plant_tag).permit(:tag_id)
  end
end
