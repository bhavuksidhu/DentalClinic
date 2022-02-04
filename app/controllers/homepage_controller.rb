class HomepageController < ApplicationController
  def home
    render layout: "dashboard"
  end
end
