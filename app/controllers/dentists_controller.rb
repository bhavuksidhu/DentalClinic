class DentistsController < ApplicationController
    layout "dashboard"

    def index 
        @q = Dentist.ransack(params[:q])
        @pagy, @users = pagy(@q.result) 
    end 

    def new 
        @dentist = Dentist.new 
    end 

    def create  
        @dentist = Dentist.new(dentist_params)

        if @dentist.save 
            redirect_to dentists_path, notice: "Dentist #{@dentist.first_name} Successfully Created!"
        else  
            render :new, status: :unprocessable_entity
        end 
    end 

    def edit 
        @dentist = Dentist.find(params[:id])
    end 

    def update 
        @dentist = Dentist.find(params[:id])
        if @dentist.update(dentist_params)
            redirect_to dentists_path, notice: "Dentist #{@dentist.first_name} Successfully Updated!"
        end 
    end 

    def destroy 
        @dentist = Dentist.find(params[:id])
        @dentist.destroy 

        redirect_to dentists_path, notice: "Dentist #{@dentist.first_name} Successfully Deleted!"
    end 

    private 

    def dentist_params 
        params.require(:dentist).permit(:first_name, :last_name, :phone)
    end 
end
