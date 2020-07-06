class SessionsController < ApplicationController
    include SessionsHelper

    def create
        user = User.find_by(email: params[:session][:email].downcase)
        if user&.authenticate(params[:session][:password])
            log_in user
            flash[:notice] = 'Logged in!'
            redirect_to user_path(user)
        else
            flash[:notice] = 'Wrong email or password combination'
            redirect_to login_path
        end
    end

    def destroy
        log_out if logged_in?
        flash[:notice] = 'Logged out'
        redirect_to login_path
    end
end
