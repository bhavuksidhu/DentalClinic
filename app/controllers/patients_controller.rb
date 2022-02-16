class PatientsController < ApplicationController
  layout "dashboard"
  include UserHelper 

  def index
    pagy_ransack(Patient)
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
end
