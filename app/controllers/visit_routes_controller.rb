class VisitRoutesController < ApplicationController
    layout "dashboard"
    def index 
        # OPTIMIZE includes 
        clinic_id = current_user.clinic.id 
        @patients = Visitroute::SearchFilter.new(params,clinic_id).search_filter.includes(:dentist,:dentist_hygienist,:treatment_coordinator,:visit_route)
        
        # Pagination
        @pagy = pagy(@patients)   
        @patient_no = 0
    end 
    
    def new 
        @visit_route = VisitRoute.new(patient_id: params[:id])
        @patient = Patient.find(params[:id])
    end 
    
    def create 
        @visit_route = VisitRoute.new(visit_params)
        @patient = Patient.find(params[:visit_route][:patient_id])
        @patient.last_visit_date = params[:visit_route][:first_visit]
        if @visit_route.save
            @patient.save 
            redirect_to visit_routes_path,notice: "Visit Route Created Successfully!"
        else 
            @patient = Patient.find(params[:visit_route][:patient_id])
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
            @patient=Patient.find(params[:visit_route][:patient_id])
            render :edit, status: :unprocessable_entity
        end 
    end     

    def monthly_tabulation
        @dentists=Dentist.all
        @dentist_hygienists=DentistHygienist.all
        @treatment_coordinators = TreatmentCoordinator.all
    end


    def new_patient_progress
        @counselings =  Patient.includes(:counseling, :visit_route).all.group_by{ |t| t.created_at.beginning_of_month }         
    end

    def new_patient_indi_progress
        @counselings = Patient.includes(:counseling, :visit_route).all.group_by{ |t| t.created_at.beginning_of_month }
    end

    private 

    def visit_params 
        params.require(:visit_route).permit(:first_visit, :second, :treatment_plan_date, :implant_correction, :self_pay_contract,:maintenance, :treatment_plan, :treatment_plan_date, :suspension, :suspended_date, :confirmation_end, :end_date, :maintenance_visit, :maintenance_visit_date, :contact_TEL, :suspension_contact_TEL, :suspended_contact_postcard, :contact_postcard, :patient_id, :visit_after_interruption, :p_heavy_defense_target, :p_heavy_defense_calculation_date, :inspection_4mm, :p_second,:inspection_3, :fop, :whitening, :medical_tube, :mt_tooth_number, :malocclusion, :note, :prosthodontics, :next_reservation_date, :thank_you_note, :thank_you_note_patient_no)
    end 
end
