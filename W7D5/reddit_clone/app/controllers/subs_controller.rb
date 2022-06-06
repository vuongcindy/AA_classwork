class SubsController < ApplicationController

    before_action :require_moderator_login, only: [:edit, :update]
    
    def index
        # debugger
        @subs = Sub.all
        render :index
    end

    def create
        @sub = Sub.new(sub_params)
        @sub.moderator_id = current_user.id

        if @sub.save
            render :show
        else
            flash[:errors] = ["Invalid information"]
            render :new
        end
    end

    def new
        @sub = Sub.new
        render :new
    end

    def show
        @sub = Sub.find(params[:id])
        render :show
    end

    def edit
        if require_moderator_login
            @sub = Sub.find(params[:id])
            render :edit
        end
    end

    def update
        if require_moderator_login
            @sub = Sub.find(params[:id])
            
            if @sub.update(sub_params)
                render :show
            else
                flash[:errors] = ["Is broken breh"]
                render :edit 
            end
        end
    end

    private
    def sub_params
        params.require(:subs).permit(:title, :description)
    end

    

end
