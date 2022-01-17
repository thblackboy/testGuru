class SessionsController < ApplicationController
  skip_before_action :authenticate_user!

  def new; end

  def destroy
    reset_session
    redirect_to login_path
  end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to cookies.delete(:redirect_after_login_path) || tests_path
    else
      flash.now[:alert] = 'Incorrect email or password'
      render :new
    end
  end
end
