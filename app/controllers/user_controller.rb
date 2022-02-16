class UserController < ApplicationController
  layout "dashboard"
  include UserHelper
  def index
    pagy_ransack(User)  
  end
end
