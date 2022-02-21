module PatientsHelper
    def pagy_ransack(model)
        if !params[:q].present? || params[:q][:s].present?
            @q = model.ransack(params[:q])
        else
            @q = model.ransack(email_cont: params[:q][:email])
        end 
        @pagy, @users = pagy(@q.result(distinct: true))     
    end 
end
