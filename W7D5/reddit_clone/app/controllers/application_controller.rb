class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?, :require_logged_in

    def current_user
        @current_user ||= User.find_by(session_token: session[:session_token])
    end

    def require_logged_in
        redirect_to users_index
    end

    def login!(user)
        session[:session_token] = user.reset_session_token!
        @current_user = user
    end

    def logged_in?
        !!current_user
    end

    def logout!(user)
        session[:session_token] = nil
        @current_user = nil
    end
end
