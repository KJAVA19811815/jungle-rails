class UsersController < ApplicationController
  def new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to '/'
      puts "THIS IS THE USER ID......"  + user.id.to_s
    else
      redirect_to '/signup'
 end
end

 private
  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
