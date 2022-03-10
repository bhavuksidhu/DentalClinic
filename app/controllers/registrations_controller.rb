class RegistrationsController < ApplicationController
    layout "dashboard"

    def index  
        if params[:q]
            @q = User.where(role: params[:q][:role]).ransack(params[:q])
            @role = params[:q][:role]
        else 
            @q = User.where(role: params[:role]).ransack(params[:q])
            @role = params[:role]
        end      
        @pagy, @users = pagy(@q.result.includes(logo_attachment: :blob))    
    end 

    def new 
        @user = User.new 
        @user.clinics.build
    end 

    def create 
        if params[:user]['role'] == "Administrator"
            @user = User.new(params_administrator) 
        else
            @user = User.new(params_clinic_user)
        end

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

    def destroy
        begin
            @user = User.find(params[:id])
            @user.destroy 
    
            redirect_to user_index_path, notice: "User #{@user.email} was successfully Deleted!"
        rescue =>e
            @error= e.message
            redirect_to user_index_path, notice: "Unsuccessfull!, Account Is Still Available!"
        end 
    end 
    
    
    private 
      
        def user_params 
            params.require(:user).permit(:role, :email, :logo)
        end 

        def params_administrator 
            params.require(:user).permit(:email, :password, :password_confirmation, :role, :logo)
        end 

        def params_clinic_user 
            params.require(:user).permit(:email, :password, :password_confirmation, :role, :logo, clinics_attributes: [:id, :name, :postal_code, :region, :address, :municipalities, :building_name, :floors, :fax_number, :phone_number])
        end 
end
