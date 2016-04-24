class AttractionsController < ApplicationController
  def index
    @attractions = Attraction.all
  end

  def show
    @attraction = Attraction.find(params[:id])
  end

  def new
    @attraction = Attraction.new
  end

  def create
    if current_user.admin
      @attraction = Attraction.new(attraction_params)
      @attraction.save
      redirect_to attraction_path(@attraction)
    else
      render :index
    end
  end

  def edit
      @attraction = Attraction.find(params[:id])
  end

  def update
    if current_user.admin
      @attraction = Attraction.find(params[:id])
      @attraction.update(attraction_params)
      redirect_to attraction_path(@attraction)
    else
      render :index
    end
  end

  def attraction_params
    params.require(:attraction).permit(:name,
                                      :min_height,
                                      :nausea_rating,
                                      :happiness_rating,
                                      :tickets)
  end
end
