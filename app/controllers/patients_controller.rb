class PatientsController < ApplicationController
  layout "dashboard"

  def index
    # OPTIMIZE includes  
    if params[:patient_number1].present? && params[:patient_number2].present? # Filter by Patient Number

      first_number, second_number = SwapValue.new(params[:patient_number1],params[:patient_number2]).swap_values   
      @users = Patient.where(patient_number: (first_number)..(second_number)).includes(:dentist,:dentist_hygienist,:treatment_coordinator)
    
    elsif params[:first_visit1].present? && params[:first_visit2].present? # Filter by visits date

      first_date, second_date = SwapValue.new(params[:first_visit1],params[:first_visit2]).swap_values   
      @users = Patient.where("(DATE(created_at) BETWEEN ? and ?) OR (DATE(created_at) = ?)", first_date, second_date, second_date).includes(:dentist,:dentist_hygienist,:treatment_coordinator)

    elsif params[:patient_name].present? # Search by Name 

      @users = Patient.where("first_name like?", "%#{params[:patient_name]}%").includes(:dentist,:dentist_hygienist,:treatment_coordinator)
      
    else  

      @users = Patient.all.includes(:dentist,:dentist_hygienist,:treatment_coordinator) 

    end 
    
    # Pagination
    @pagy = pagy(@users)
  end

  def show 
    @patient = Patient.find(params[:id])
  end 

  def new 
    @patient = Patient.new 
  end 

  def create 
    @patient = Patient.new(patient_params)

    if @patient.save 
      redirect_to patients_path, notice: "Patient #{@patient.first_name} Successfully Created!"
    else  
      render :new, status: :unprocessable_entity
    end 
  end 

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

  def patient_params 
    params.require(:patient).permit(:first_name, :last_name, :phone, :patient_number, :patient_visit_route, :keyword, :panorama, :caries_check, :course, :p_course, :note, :dentist_id, :dentist_hygienist_id, :treatment_coordinator_id)
  end 

  def appointment_params 
    params.require(:patient).permit(:appointment_date)
  end 
end
