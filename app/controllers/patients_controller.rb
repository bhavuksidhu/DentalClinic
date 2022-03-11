class PatientsController < ApplicationController
  layout "dashboard"

  def index
    # OPTIMIZE includes  
    @patients = SearchFilter.new(params).search_filter.includes(:dentist,:dentist_hygienist,:treatment_coordinator,:visit_route)
    # Pagination
    @pagy = pagy(@patients)
  end

  def show 
    @patient = Patient.find(params[:id])
  end 

  def new 
    @patient = Patient.new 
  end 

  def create 
    if current_user.clinics.present?
      @patient = Patient.new(patient_params)
      @patient.clinic_id = current_user.clinics.first.id 

      if @patient.save 
        redirect_to patients_path, notice: "Patient #{@patient.first_name} Successfully Created!"
      else  
        render :new, status: :unprocessable_entity
      end 
    else
      redirect_to request.referer, alert: "First create your clinic."
    end
  end 

  # All Appointments List 
  def all_appointment 
    @patients = search_filter(params).includes(:visit_route)

    # Pagination
    @pagy = pagy(@patients)
  end 

  def create_appointment 
    patient = Patient.find_by(patient_number: params[:patient_number].to_i)
    if patient.present?  
        unless patient.visit_route.present?
          redirect_to all_appointment_patients_path, alert: "Create Visit Route First!"
        else  
          redirect_to all_appointment_patients_path, notice: "New Appointment!" if patient.visit_route.update(next_reservation_date: params[:next_reservation])
        end 
    else 
        redirect_to all_appointment_patients_path, alert: "Patient Number Is Not Available!"
    end 
  end 

  # Last Visits List
  def last_visit 
    @patients = search_filter(params)  
    @pagy = pagy(@patients) # Pagination
  end 

  def create_last_visit 
    patient = Patient.find_by(patient_number: params[:patient_number].to_i)
    if patient.present? && params[:last_visit].to_date <= Date.today 
        patient.update(last_visit_date: params[:last_visit])  
        redirect_to last_visit_patients_path, notice: "Last Visit Date Updated!"
    else  
        redirect_to last_visit_patients_path, alert: "Patient Number Is Not Available!"
    end 
  end 


  # Appointment Jquery
  def appointment 
    @patient = Patient.find(params[:id])
  end 
  
  def add_appointment 
    @patient = Patient.find(params[:id])
       
    if params[:patient][:appointment_date] <= DateTime.now 
      redirect_to patient_path(@patient), notice: "Can't select older dates!" 
    else 
      @patient.appointment.push params[:patient][:appointment_date] 
      @patient.save  
      redirect_to patient_path(@patient), notice: "New Appointment Added!"
    end 
  end 

  def edit 
    @patient = Patient.find(params[:id])
  end 

  def update 
    @patient = Patient.find(params[:id])
    if @patient.update(patient_params) 
      redirect_to patients_path, notice: "Patient #{@patient.first_name} Successfully Updated!"
    else  
      render :edit, status: :unprocessable_entity
    end 
  end 

  def destroy 
    @patient = Patient.find(params[:id])
    @patient.destroy 

    redirect_to patients_path, notice: "Patient #{@patient.first_name} Successfully Deleted!"
  end 

  private 

  def appointment_params 
    params.require(:appointment).permit(:patient_number,:appointment_date)
  end 

  def patient_params 
    params.require(:patient).permit(:first_name, :last_name, :phone, :patient_number, :patient_visit_route, :keyword, :panorama, :caries_check, :course, :p_course, :note, :dentist_id, :dentist_hygienist_id, :treatment_coordinator_id)
  end 

  # def appointment_params 
  #   params.require(:patient).permit(:appointment_date)
  # end 
end
