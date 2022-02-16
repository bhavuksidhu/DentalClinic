class ManagersController < ApplicationController
  layout "dashboard"
  include UserHelper
  def index
    pagy_ransack(Manager) 
  end

  def new 
    @manager = Manager.new
  end 

  def edit 
    @manager = Manager.find(params[:id])
  end 

  def update 
    @manager = Manager.find(params[:id])

    if @manager.update(manager_params)
      redirect_to managers_path, notice: "Manager #{@manager.first_name} Successfully Updated!" 
    else  
      render :edit, status: :unprocessable_entity
    end  
  end 

  def create 
    @manager = Manager.new(manager_params)
    if @manager.save 
      redirect_to managers_path, notice: "Manager #{@manager.first_name} Successfully Created!" 
    else 
      render :new, status: :unprocessable_entity
    end 
  end 

  def destroy 
    @manager = Manager.find(params[:id])
    @manager.destroy 

    redirect_to managers_path, notice: "Manager #{@manager.first_name} was successfully Deleted!"
  end 

  private 
    def manager_params 
      params.require(:manager).permit(:first_name,:last_name)
    end 
end
