class VisitRoutesController < ApplicationController
    layout "dashboard"
    def index 
        # OPTIMIZE includes 
        if params[:patient_number1].present? && params[:patient_number2].present? # Filter by Patient Number
                
            first_number, second_number = SwapValue.new(params[:patient_number1],params[:patient_number2]).swap_values   
            patients = Patient.where(patient_number: (first_number)..(second_number))
            
        elsif params[:first_visit1].present? && params[:first_visit2].present? # Filter by visits date

            first_date, second_date = SwapValue.new(params[:first_visit1],params[:first_visit2]).swap_values 
            patients = Patient.joins(:visit_route).where(visit_route:{first_visit: (first_date)..(second_date)})

        elsif params[:second_reservation1].present? && params[:second_reservation2].present? # Filter Second date 

            first_date, second_date = SwapValue.new(params[:second_reservation1],params[:second_reservation2]).swap_values 
            patients = Patient.joins(:visit_route).where(visit_route:{second: (first_date)..(second_date)})

        elsif params[:treatment1].present? && params[:treatment2].present? # Filter Treatment Plan 

            first_date, second_date = SwapValue.new(params[:treatment1],params[:treatment2]).swap_values 
            patients = Patient.joins(:visit_route).where(visit_route:{treatment_plan_date: (first_date)..(second_date)})

        elsif params[:visit_route].present? # Search by visit_route
            
            patients = Patient.where("patient_visit_route like?", "%#{params[:visit_route]}%")

        elsif params[:dr].present? # Search by Dentist
               
            patients = Patient.joins(:dentist).where("lower(dentists.first_name) like?","%#{params[:dr].downcase}%")
            
        elsif params[:dh].present? # Search by Dentist Hyginest
            
            patients = Patient.joins(:dentist_hygienist).where("lower(dentist_hygienists.first_name) like?","%#{params[:dh].downcase}%")   
            
        elsif params[:tc].present? # Search by Dentist Hyginest
            
            patients = Patient.joins(:treatment_coordinator).where("lower(treatment_coordinators.first_name) like?","%#{params[:tc].downcase}%")   

        else  
            
            patients = Patient.all
    
        end 
        
        # Pagination
        @patients = patients.includes(:dentist,:dentist_hygienist,:treatment_coordinator,:visit_route)
        @pagy = pagy(@patients)   

    end 
    
    def new 
        @visit_route = VisitRoute.new(patient_id: params[:id])
        @patient = Patient.find(params[:id])
    end 
    
    def create 
        @visit_route = VisitRoute.new(visit_params)

        if @visit_route.save
            redirect_to visit_routes_path,notice: "Visit Route Created Successfully!"
        else  
            render :new 
        end 
    end 

    def edit 
        @visit_route = VisitRoute.find(params[:id])
        @patient = Patient.find(params[:patient])
    end 

    def update 
        @visit_route = VisitRoute.find(params[:id])
        if @visit_route.update(visit_params)
            redirect_to visit_routes_path, notice: "Visit Route Successfully Updated!"
        else  
            render :edit, status: :unprocessable_entity
        end 
    end     

    private 

    def visit_params 
        params.require(:visit_route).permit(:first_visit, :second, :treatment_plan_date, :implant_correction, :self_pay_contract,:maintenance, :treatment_plan, :treatment_plan_date, :suspension, :suspended_date, :confirmation_end, :end_date, :maintenance_visit, :maintenance_visit_date, :contact_TEL, :suspension_contact_TEL, :suspended_contact_postcard, :contact_postcard, :patient_id, :visit_after_interruption, :p_heavy_defense_target, :p_heavy_defense_calculation_date, :inspection_4mm, :p_second,:inspection_3, :fop, :whitening, :medical_tube, :mt_tooth_number, :malocclusion, :note, :prosthodontics, :next_reservation_date, :thank_you_note, :thank_you_note_patient_no)
    end 
end
