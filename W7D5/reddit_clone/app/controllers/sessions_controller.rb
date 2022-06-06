class SessionsController < ApplicationController
    def new
        @user = User.new
        render :new
    end

    def create
        @user = User.find_by_credentials(params[:users][:username], params[:users][:password])

        if @user
            login!(@user)
            redirect_to user_url(@user)
        else
            flash[:errors] = ["Invalid credentials"]
            render :new
        end
    end

    def destroy
        logout!(current_user)
        redirect_to users_url
    end
end
