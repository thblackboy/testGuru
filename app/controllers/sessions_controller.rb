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
      if cookies[:path].present?
        redirect_to cookies[:path]
      else
        redirect_to tests_path
      end
    else
      flash.now[:alert] = 'Incorrect email or password'
      render :new
    end
  end
end
