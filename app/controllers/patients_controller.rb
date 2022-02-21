class PatientsController < ApplicationController
  layout "dashboard"

  def index
    @q = Patient.ransack(params[:q])
    @pagy, @users = pagy(@q.result) 
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
    params.require(:patient).permit(:first_name, :last_name, :phone)
  end 

  def appointment_params 
    params.require(:patient).permit(:appointment_date)
  end 
end
