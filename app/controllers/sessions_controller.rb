class SessionsController < ApplicationController
  def login
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id 
      render json: user, status: :ok
    else
      render json: {message: "Not authenticated"}
    end
  end

  def logout
    session.delete :user_id
    render json: {message: "Log out success"}
  end
end
