class ArtworksController < ApplicationController

    def show
      @artworks = Artwork.find_by(id: params[:id])
      render json: @artworks
    end

    def index
      if params.has_key?(:user_id)
        #@articles = Artwork.joins(:viewing_users).where(user_id: params[:id])
        @articles = Artwork.left_outer_joins(:shared_viewers).where("artist_id = #{params[:user_id]} OR viewer_id = #{params[:user_id]}")
      else
        # index of top-level resource
        @articles = Artwork.all
      end
      render json: @articles
    end

    def update
      @artworks = Artwork.find(params[:id])
      if @artworks.update(artwork_params)
        redirect_to artworks_url(params[:id])
      else
        render json: @artworks.errors.full_messages, status: 422
      end

    end
    
    def create
      artworks = Artwork.new(artwork_params)
        if artworks.save!
          render json: artworks
        else
          render json: artworks.errors.full_messages, status: :unprocessable_entity
        end
    end

    def destroy
      @artworks = Artwork.find_by(id: params[:id])
      @artworks.destroy
      redirect artworks_url
    end

    private
    def artwork_params
      params.require(:artwork).permit(:artist_id, :title, :img_url)
    end
end
