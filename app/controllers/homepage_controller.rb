class HomepageController < ApplicationController
  layout "dashboard"
  def home
    @users_count = User.count 
    @manager_count = Manager.count 
    @dentist_count = Dentist.count 
    @agent_count = Agent.count 
    @patient_count = Patient.count 
    @dentist_hygienist_count = DentistHygienist.count 
  end

  def translate
    if params[:locale] == 'en'
      session[:translate]= 'en'
    else 
      session[:translate]= "ja"
    end
    redirect_to request.referer
  end
end
