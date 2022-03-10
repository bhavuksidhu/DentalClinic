class OralTypesController < ApplicationController
    layout "dashboard"
   
   
    def index
        @oral_types =  OralType.all
    end

    def new
        @oral_type = OralType.new 
    end

    def create  
        @oral_type = OralType.new(oral_type_params)

        if @oral_type.save 
            redirect_to oral_type_path, notice: "Oral Type #{@oral_type.name} Successfully Created!"
        else  
            render :new, status: :unprocessable_entity
        end 
    end 

    def edit 
        @oral_type = OralType.find(params[:id])
    end



    private

    def oral_type_params 
        params.require(:oral_type).permit(:name, :exp_date, :imp_date)
    end 
end
