class SessionController < ApplicationController
  skip_before_filter :require_user, :only => [:create, :new]

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user and user.authenticate(params[:session][:password])
      if user.confirmed and user.approved
        session[:user_id] = user.id
        redirect_to root_url
      elsif user.confirmed
        flash[:error] = "You need to be approved by an admin first!"
        render "new"
      elsif user.approved
        flash[:error] = "You need to confirm your email first!"
        render "new"
      else
        flash[:error] = "You need to confirm your email and be approved by an admin."
        render "new"
      end
    else
      flash[:error] = "Login failed."
      render "new"
    end
  end

  def destroy
    session.delete(:user_id)
    @current_user = nil
    redirect_to root_url
  end
end
