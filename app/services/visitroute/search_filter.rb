module Visitroute
    class SearchFilter 
        def initialize(params)
            @params = params 
        end 

        def search_filter 
            if @params[:patient_number1].present? && @params[:patient_number2].present? # Filter by Patient Number
                    
                first_number, second_number = SwapValue.new(@params[:patient_number1],@params[:patient_number2]).swap_values   
                patients = Patient.where(patient_number: (first_number)..(second_number))
                
            elsif @params[:first_visit1].present? && @params[:first_visit2].present? # Filter by visits date

                first_date, second_date = SwapValue.new(@params[:first_visit1],@params[:first_visit2]).swap_values 
                patients = Patient.joins(:visit_route).where(visit_route:{first_visit: (first_date)..(second_date)})

            elsif @params[:second_reservation1].present? && @params[:second_reservation2].present? # Filter Second date 

                first_date, second_date = SwapValue.new(@params[:second_reservation1],@params[:second_reservation2]).swap_values 
                patients = Patient.joins(:visit_route).where(visit_route:{second: (first_date)..(second_date)})

            elsif @params[:treatment1].present? && @params[:treatment2].present? # Filter Treatment Plan 

                first_date, second_date = SwapValue.new(@params[:treatment1],@params[:treatment2]).swap_values 
                patients = Patient.joins(:visit_route).where(visit_route:{treatment_plan_date: (first_date)..(second_date)})

            elsif @params[:visit_route].present? # Search by visit_route
                
                patients = Patient.where("patient_visit_route like?", "%#{@params[:visit_route]}%")

            elsif @params[:dr].present? # Search by Dentist
                
                patients = Patient.joins(:dentist).where("lower(dentists.first_name) like?","%#{@params[:dr].downcase}%")
                
            elsif @params[:dh].present? # Search by Dentist Hyginest
                
                patients = Patient.joins(:dentist_hygienist).where("lower(dentist_hygienists.first_name) like?","%#{@params[:dh].downcase}%")   
                
            elsif @params[:tc].present? # Search by Dentist Hyginest
                
                patients = Patient.joins(:treatment_coordinator).where("lower(treatment_coordinators.first_name) like?","%#{@params[:tc].downcase}%")   

            else  
                
                patients = Patient.all
        
            end 
        end 
    end 
end 