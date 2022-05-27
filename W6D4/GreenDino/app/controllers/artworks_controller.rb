class ArtworksController < ApplicationController
    def index
        # debugger
        # @artworks.owned = User.find(params[:user_id]).artworks
        # @artworks.shared_with_user = User.find(params[:user_id])
        # render json: @artworks.owned
        # render json: @artworks.shared_with_user
        if params[:user_id]
            @artworks = Artwork.where(artist_id: params[:user_id])
            # render json: @artworks
        else
            @artworks = Artwork.all
            # render json: @artworks
        end
        render json: @artworks
    end

    def create
        # debugger
        @artwork = Artwork.new(artwork_params)
        
        if @artwork.save
            redirect_to artwork_url(@artworks)
        else
            render json: @artwork.errors.full_messages, status: 422
        end
    end

    def show
        @artwork = Artwork.find(params[:id])
        render json: @artwork
    end

    def update
        @artwork = Artwork.find(params[:id])
        if @artwork.update(artwork_params)
            redirect_to artwork_url(@artwork)
        else
            render json: @artwork.errors.full_messages, status: 422
        end
    end

    def destroy
        @artwork = Artwork.find(params[:id])
        @artwork.destroy
        redirect_to artworks_url
    end 

    private
    def artwork_params
        params.require(:artwork).permit(:image_url, :title)
    end
end
