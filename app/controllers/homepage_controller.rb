class HomepageController < ApplicationController
  def home
    @users_count = User.count 
    render layout: "dashboard"
  end
end
