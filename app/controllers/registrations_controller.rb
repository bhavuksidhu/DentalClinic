class RegistrationsController < ApplicationController
    layout "dashboard"

    def new 
        @user = User.new 
    end 

    def create 
        @user = User.new(params_user)

        if @user.save
            redirect_to user_index_path, notice: "New User Created Successfully!"
        else  
            render :new
        end 
    end 

    def edit 
        @user = User.find(params[:id])
    end 
    
    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
            redirect_to user_index_path, notice: "User #{@user.email} Successfully Updated!"
        else  
            render :edit 
        end 
    end 
    
    
    private 
      
        def user_params 
            params.require(:user).permit(:role, :email, :logo)
        end 

        def params_user 
            params.require(:user).permit(:email, :password, :password_confirmation, :role, :logo)
        end 
end
