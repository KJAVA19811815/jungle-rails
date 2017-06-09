class Admin::DashboardController < ApplicationController
  name = ENV["HTTP_AUTH_NAME"]
  password = ENV["HTTP_AUTH_PASS"]

  http_basic_authenticate_with name: name, password: password


  def show
  end
end
