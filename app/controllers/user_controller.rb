class UserController < ApplicationController
  include UserHelper
  def index
    pagy_ransack(User)
    render layout: "dashboard"
  end
end
