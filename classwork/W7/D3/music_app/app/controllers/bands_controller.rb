class BandsController < ApplicationController
  def index
    @bands = Band.all
    render :index
  end

  def create
    band = Band.new(valid_params)
    if band.save!
      redirect_to band_url(band)
    else 
      render :new
    end
  end

  def show
    @band = Band.find_by(id: params[:id])
    render :show
  end
  
  def new
    @band = Band.new
    render :new
  end

  def edit
    @band = Band.find_by(id: params[:id])
    render :edit
  end

  def update
    @band = Band.find_by(id: params[:id])
    if @band.update(valid_params)
      redirect_to band_url(@band)
    else 
      render :edit
    end
  end

  def destroy
    @band = Band.find_by(id: params[:id])
    @band.destroy
    redirect_to bands_url
  end

  private
  def valid_params
    params.require(:band).permit(:name)
  end
end
