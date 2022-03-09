class VisitRoutesController < ApplicationController
    layout "dashboard"
    def index 
        @patients = Patient.all.includes(:dentist,:dentist_hygienist,:treatment_coordinator,:visit_route)   
    end 
    
    def new 
        @visit_route = VisitRoute.new(patient_id: params[:id])
        @patient = Patient.find(params[:id])
    end 
    
    def create 
        @visit_route = VisitRoute.new(visit_params)
        if @visit_route.save 
            redirect_to visit_routes_path,notice: "Success"
        else  
            render :new 
        end 
    end 

    def edit 
        @visit_route = VisitRoute.find(params[:id])
        @patient = Patient.find(params[:patient])
    end 

    def monthly_tabulation
        @dentists=Dentist.all
        @dentist_hygienists=DentistHygienist.all
        @treatment_coordinators = TreatmentCoordinator.all
    end

    def update 
        @visit_route = VisitRoute.find(params[:id])
        if @visit_route.update(visit_params)
            redirect_to visit_routes_path, notice: "Visit Route Successfully Updated!"
        else  
            render :edit, status: :unprocessable_entity
        end 
    end     

    def new_patient_progress
        #  # first visit consult
        # initial_consultation = Counseling.all.pluck(:first_visit).count
        # no_of_patients = Patient.count
        # @first_visit = initial_consultation/no_of_patients

        # # second
        # second_patient = Counseling.all.pluck(:second_visit).count
        # @second_visit = second_patient/no_of_patients
        


    end

    private 

    def visit_params 
        params.require(:visit_route).permit(:first_visit, :second, :treatment_plan_date, :implant_correction, :self_pay_contract,:maintenance, :treatment_plan, :treatment_plan_date, :suspension, :suspended_date, :confirmation_end, :end_date, :maintenance_visit, :maintenance_visit_date, :contact_TEL, :suspension_contact_TEL, :suspended_contact_postcard, :contact_postcard, :patient_id, :visit_after_interruption, :p_heavy_defense_target, :p_heavy_defense_calculation_date, :inspection_4mm, :p_second,:inspection_3, :fop, :whitening, :medical_tube, :mt_tooth_number, :malocclusion, :note, :prosthodontics, :next_reservation_date, :thank_you_note, :thank_you_note_patient_no)
    end 
end
