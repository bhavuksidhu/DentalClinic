class StaffInfosController < ApplicationController
  layout "dashboard"
  before_action :set_staff_info, only: %i[ show edit update destroy ]

  # GET /staff_infos or /staff_infos.json
  def index
    @q = StaffInfo.ransack(params[:q])
    @pagy, @users = pagy(@q.result)
  end

  # GET /staff_infos/1 or /staff_infos/1.json
  def show
    @staff_info = StaffInfo.find(params[:id])
  end

  # GET /staff_infos/new
  def new
    @staff_info = StaffInfo.new
  end

  # GET /staff_infos/1/edit
  def edit
    @staff_info = StaffInfo.find(params[:id])
  end

  # POST /staff_infos or /staff_infos.json
  def create
    @staff_info = StaffInfo.new(staff_info_params)

    if @staff_info.save 
      redirect_to staff_infos_path, notice: "Staff Info  #{@staff_info.first_name} Successfully Created!"
    else  
      render :new, status: :unprocessable_entity
    end 
  end

  # PATCH/PUT /staff_infos/1 or /staff_infos/1.json
  def update
    respond_to do |format|
      if @staff_info.update(staff_info_params)
        format.html { redirect_to staff_info_url(@staff_info), notice: "Staff info was successfully updated." }
        format.json { render :show, status: :ok, location: @staff_info }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @staff_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /staff_infos/1 or /staff_infos/1.json
  def destroy
    @staff_info = StaffInfo.find(params[:id])
    @staff_info.destroy 

    redirect_to staff_infos_path, notice: "Staff Information #{@staff_info.first_name} was successfully Deleted!"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_staff_info
      @staff_info = StaffInfo.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def staff_info_params
      params.require(:staff_info).permit(:staff_code, :first_name, :last_name, :sex, :job_type, :occupation, :usage_classification, :hire_date, :date_of_leaving_company)
    end
end
