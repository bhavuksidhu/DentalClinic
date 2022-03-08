class CounselingsController < ApplicationController
    layout "dashboard"



    # GET /counsel or /staff_infos.json
  def index

      @q = Counseling.ransack(params[:q])
      @pagy, @users = pagy(@q.result)
    
  end

  def new 
    @counseling = Counseling.new 
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
                                            :cons_sign_date, :contract_amt, oral_types_attributes: [:id, :name, :exp_date, :imp_date])
    end 

end
