class HomepageController < ApplicationController
  def home
    if !params[:q].present? || params[:q][:s].present?
      @q = User.ransack(params[:q])
      @pagy, @users = pagy(@q.result(distinct: true))
      # binding.pry
    else
      @q = User.ransack(email_cont: params[:q][:email])
      @pagy, @users = pagy(@q.result(distinct: true))     
    end 
    render layout: "dashboard"
  end
end
