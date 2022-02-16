class HomepageController < ApplicationController
  layout "dashboard"
  def home
    @users_count = User.count 
  end
end
