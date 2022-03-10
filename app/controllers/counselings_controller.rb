class CounselingsController < ApplicationController
    layout "dashboard"



    # GET /counsel or /staff_infos.json
  def index      
    if params[:patient_number1].present? && params[:patient_number2].present? # Filter by Patient Number
      first_number, second_number = SwapValue.new(params[:patient_number1],params[:patient_number2]).swap_values   
      @users = Patient.where(patient_number: (first_number)..(second_number)).includes(:patient_name,:aggregation_basic_information)
    else
      @patients = Patient.all.includes(:counseling)   
    end  
    
    # pagination
    @pagy = pagy(@patients)
  end

  def new 
    @counseling = Counseling.new(patient_id: params[:id])
    @patient = Patient.find(params[:id])
    @counseling.oral_types.build
  end

  def create  
    @counseling = Counseling.new(counseling_params)
    if @counseling.save 
        redirect_to counselings_path, notice: "Counseling #{@counseling.resp_dr} Successfully Created!"
    else  
        render :new, status: :unprocessable_entity
    end 
  end
  
  def edit 
    @counseling = Counseling.includes(:oral_types).find(params[:id])
    @patient = Patient.find(params[:patient])
  end 

  def destroy 
    @counseling = Counseling.find(params[:id])
    @counseling.destroy 
    redirect_to counselings_path, notice: "Counseling #{@counseling.resp_dr} Successfully Deleted!"
  end 

  def aggregation_basic_information
      @aggregation_period=params[:aggregation_period]

      if @aggregation_period == "6Months"
        @aggregation_basic_information=Counseling.where(created_at: 6.months.ago..Time.now)

      elsif @aggregation_period == "1Year"
        @aggregation_basic_information=Counseling.where(created_at: 1.year.ago..Time.now)

      elsif @aggregation_period == "7Days"
        @aggregation_basic_information=Counseling.where(created_at: 7.days.ago..Time.now)

      elsif @aggregation_period == "15Days"
        @aggregation_basic_information=Counseling.where(created_at: 15.days.ago..Time.now)

      elsif @aggregation_period == "30Days"
        @aggregation_basic_information=Counseling.where(created_at: 30.days.ago..Time.now)

      elsif @aggregation_period == "Today"
        @aggregation_basic_information=Counseling.where(created_at: Time.now)
        
      else
        @aggregation_period = "All"
        @aggregation_basic_information=Counseling.all
      end
  end


  def update 
      @counseling = Counseling.find(params[:id])
    if @counseling.update(counseling_params)
        redirect_to counselings_path, notice: "Counseling #{@counseling.resp_dr} Successfully Updated!"
    end 
  end 

  private 

    def counseling_params 
        params.require(:counseling).permit(:resp_dr, :resp_couns_staff,
                                            :course_imp_date, :pcourse_imp_date, :first_visit,
                                            :re_first_visit, :second_visit, :p_consult, :inspection,
                                            :treat_plan, :prostho, :denture, :whitening, :implant,
                                            :invisalign, :other_correc, :micro, :maintainance,
                                            :main_resv_date, :main_trans, :type_agree, :prostho_type,
                                            :no_of_implant, :site, :offer_amt, :agreement,
                                            :cons_sign_date, :contract_amt, :patient_id, oral_types_attributes: [:id, :name, :exp_date, :imp_date])
    end 

end
