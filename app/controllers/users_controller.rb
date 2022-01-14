class UsersController < ApplicationController
  def index
    user = User.all  
  end

  def signup
    user = User.new(users_params)
    if user.save
      session[:user_id] = user.id
      render json: {message: "Signed up successfuly"}, status: :created
    else
      render Json: {message: "Unexpected error"}
    end
  end

  def show
    if current_user
      #user = User.find_by_id(params[:id])
      render json: current_user, status: :ok
    else
      render json: {message: "You must be logged in"}
    end
  end

private 
  def users_params
    params.permit(:name, :email, :password)
  end
end
