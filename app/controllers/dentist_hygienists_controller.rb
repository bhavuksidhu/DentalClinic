class DentistHygienistsController < ApplicationController
    layout "dashboard"

    def index 
        @q = DentistHygienist.ransack(params[:q])
        @pagy, @users = pagy(@q.result)  
    end 

    def new 
        @dentist_hygienist = DentistHygienist.new 
    end 

    def create 
        @dentist_hygienist = DentistHygienist.new(param_dentist_hygienist)

        if @dentist_hygienist.save 
            redirect_to dentist_hygienists_path, notice: "Dentist Hygienist #{@dentist_hygienist.first_name} Successfully Created!"
        else  
            render :new, status: :unprocessable_entity 
        end 
    end 

    def edit 
        @dentist_hygienist = DentistHygienist.find(params[:id])
    end 

    def update 
        @dentist_hygienist = DentistHygienist.find(params[:id])
        binding.pry
        if @dentist_hygienist.update(param_dentist_hygienist)
            redirect_to dentist_hygienists_path, notice: "Dentist Hygienist #{@dentist_hygienist.first_name} Successfully Updated!"
        else  
            render :edit, status: :unprocessable_entity
        end 
    end 

    def destroy 
        @dentist_hygienist = DentistHygienist.find(params[:id])
        @dentist_hygienist.destroy 

        redirect_to dentist_hygienists_path, notice: "Denist Hygienist #{@dentist_hygienist.first_name} Successfully Deleted!"
    end 

    private 

    def param_dentist_hygienist 
        params.require(:dentist_hygienist).permit(:first_name,:last_name,:phone)
    end 
end
