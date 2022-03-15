class SearchFilter 
    def initialize(params,clinic_id)
        @params = params 
        @clinic_id = clinic_id 
    end 

    # Searching And Filtering 
    def search_filter
        if @params[:patient_number1].present? && @params[:patient_number2].present? # Filter by Patient Number

            first_number, second_number = SwapValue.new(@params[:patient_number1],@params[:patient_number2]).swap_values   
            @patients = Patient.where(clinic_id: @clinic_id, patient_number: (first_number)..(second_number))
            
        elsif @params[:first_visit1].present? && @params[:first_visit2].present? # Filter by visits date

            first_date, second_date = SwapValue.new(@params[:first_visit1],@params[:first_visit2]).swap_values 
            @patients = Patient.joins(:visit_route).where(clinic_id: @clinic_id,visit_route:{first_visit: (first_date)..(second_date)})
            
        elsif @params[:next_reservation1].present? && @params[:next_reservation2].present? # Filter next reservation date 

            first_date, second_date = SwapValue.new(@params[:next_reservation1],@params[:next_reservation2]).swap_values 
            @patients = Patient.joins(:visit_route).where(clinic_id: @clinic_id,visit_route:{next_reservation_date: (first_date)..(second_date)})

        elsif @params[:last_visit1].present? && @params[:last_visit2].present? #Filter Last Visit Date 

            first_date, second_date = SwapValue.new(@params[:last_visit1],@params[:last_visit2]).swap_values 
            @patients = Patient.where(clinic_id: @clinic_id,last_visit_date: (first_date)..(second_date))

        elsif @params[:patient_name].present? # Search by Name 
            #OPTIMIZE 
            @patients = Patient.where(clinic_id: @clinic_id).where("first_name like :s or last_name like :s or first_name || ' ' || last_name like :s", :s => "%#{@params[:patient_name].titleize}")

        else  

            @patients = Patient.where(clinic_id: @clinic_id)
        end 
    end 
end 
