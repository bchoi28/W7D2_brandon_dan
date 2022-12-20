class SessionsController < ApplicationController

    def new
        @user = User.new
        render :new
    end


    def create
        email = params[:user][:email]
        password = params[:user][:password]
        user = User.find_by_credentials(email, password)
        if user
            login!(user)
            redirect_to user_url(user)
        else
            user = User.new(email: params[:user][:email], password: [:user][:password])
            flash.now[:errors] = ["Invalid credentials, Please try again"]
            render :new
        end
    end


    def destroy
        if logged_in?
            logout!
        flash[:messages] = ["Successfully logged out"]
        end

        redirect_to new_session_url        

    end



end
