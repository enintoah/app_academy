class AlbumsController < ApplicationController
  def new
    if params.has_key?(:band_id)
      @album = Album.new(band_id: params[band_id])
    else 
      @album = Album.new
    end
    render :new
  end

  def create
    album = Album.new(valid_params)
    if album.save!
      redirect_to album_url(album)
    else 
      render :new
    end
  end

  def edit
    @album = Album.find_by(id: params[:id])
    render :edit
  end

  def show
    @album = Album.find_by(id: params[:id])
    render :show
  end

  def update
    @album = Album.find_by(id: params[:id])
    if @album.update(valid_params)
      redirect_to album_url(@album)
    else 
      render :edit
    end
  end

  def destroy
    @album = Album.find_by(id: params[:id])
    @album.destroy
    redirect_to bands_url
  end

  private
  def valid_params
    params.require(:album).permit(:title, :year, :category, :band_id)
  end
end
