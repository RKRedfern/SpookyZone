class SessionsController < ApplicationController
    
    def home
    end

    def destroy
        session.clear
        redirect_to '/'
    end

    def create
        #nested password in params hash found below 
        user = User.find_by(username: params[:user][:username])
        if user && user.authenticate(params[:user][:password])
            session[:user_id] = user.id
            redirect_to user_path(user) #"/users/#(user.id)"
        else
            flash[:message] = "That doesn't seem to be correct, please try again"
            redirect_to "/login"
        end
    end



end 


# ActionController::Parameters {"authenticity_token"=>"F9Grxw_yNWa8n8_07QSm2beSV4wIkvPXfpNwwD2wVj1ZolF8Xj1Q671II7ZI3dLm7zT1azdvXE7SLNYJlRxzGg", 

# "user"=>{"username"=>"Riley", "password"=>"test"}, "commit"=>"Submit", "controller"=>"sessions", "action"=>"create"} permitted: false>