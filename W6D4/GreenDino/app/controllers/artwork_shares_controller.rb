class ArtworkSharesController < ApplicationController

    def create
        debugger
        @artwork_shares = ArtworkShare.new(artwork_params)
        
        if @artwork_shares.save
            render json: @artwork_shares
        else
            render json: @artwork_shares.errors.full_messages, status: 422
        end
    end

    def destroy
        @artwork_shares = ArtworkShare.find(params[:id])
        render json: @artwork_shares
        @artwork_shares.destroy
    end 

    private
    def artwork_shares_params
        params.require(:artwork_shares).permit(:artwork_id, :viewer_id)
    end
end
