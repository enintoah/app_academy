class ArtworkSharesController < ApplicationController

  # def index
  #   @artworkshare = ArtworkShare.all
  #   render json: @artworkshare
  # end

  def create
    artworkshare = ArtworkShare.new(artwork_share_params)
    if artworkshare.save!
      render json: artworkshare
    else 
      render json: artworkshare.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    @artworkshare = ArtworkShare.find(params[:id])
    if @artworkshare
      render json: @artworkshare
      @artworkshare.destroy
    else
      render json: @artworkshare.errors.full_messages, status: 422
    end
  end
  
  private 
  def artwork_share_params
    params.require(:artworkshare).permit(:viewer_id, :artwork_id)
  end
end
