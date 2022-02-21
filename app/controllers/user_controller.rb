class UserController < ApplicationController
  layout "dashboard"

  def index
    @q = User.ransack(params[:q])
    @pagy, @users = pagy(@q.result.includes(logo_attachment: :blob)) 
  end

  # def change_pass 
  #   @user = User.find(params[:id])
  # end 

  # def update_pass 
  #   @user = User.find(params[:id])
  #   if @user.update(user_params)
  #     redirect_to user_index_path, notice: "User #{@user.email} Successfully Updated!"
  #   end 
  # end 

  # private 

  # def user_params 
  #   params.require(:user).permit(:role,:email)
  # end 
end
