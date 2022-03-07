class CounselingsController < ApplicationController
    layout "dashboard"



    # GET /counsel or /staff_infos.json
  def index

      @q = Counseling.ransack(params[:q])
      @pagy, @users = pagy(@q.result)
    
  end

  def new 
    @counseling = Counseling.new 
  end

  def create  
    @counseling = Counseling.new(counseling_params)

    if @counseling.save 
        redirect_to counselings_path, notice: "Counseling #{@counseling.resp_dr} Successfully Created!"
    else  
        render :new, status: :unprocessable_entity
    end 
end 


  private 

    def counseling_params 
        params.require(:counseling).permit(:resp_dr, :resp_couns_staff, :imp_type, :exp_date, :imp_date,
                                            :course_name, :course_imp_date, :course_type, :first_visit,
                                            :re_first_visit, :second_visit, :p_consult, :inspection,
                                            :treat_plan, :prostho, :denture, :whitening, :implant,
                                            :invisalign, :other_correc, :micro, :maintainance,
                                            :main_resv_date, :main_trans, :type_agree, :prostho_type,
                                            :no_of_implant, :site, :offer_amt, :agreement,
                                            :cons_sign_date, :contract_amt)
    end 

end
