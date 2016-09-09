class SessionsController < ApplicationController

  def new
  end

  def create
    if env['omniauth.auth'] == nil
      user = User.find_by(email: params[:session][:email].downcase)
      if user && user.authenticate(params[:session][:password])
        log_in user
        redirect_back_or root_url
      else
        flash.now[:danger] = 'Invalid email/password combination'
        render 'new'
      end
    else
      user = User.from_omniauth(env["omniauth.auth"])
      log_in user
      redirect_back_or root_url
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end