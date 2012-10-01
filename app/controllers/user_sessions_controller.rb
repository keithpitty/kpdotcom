# coding: utf-8

class UserSessionsController < AdminLayoutController
  before_filter :require_no_user, :only => [:create]
  before_filter :require_user, :only => :destroy

  def new
    if current_user
      redirect_to admin_url
    else
      @user_session = UserSession.new
    end
  end

  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      logger.info "User session created."
      msg = "Login successful!"
      redirect_to(admin_url, :notice => msg)
    else
      flash[:error] = "Bad credentials, man!"
      render :action => :new
    end
  end

  def destroy
    current_user_session.destroy
    redirect_to(login_url, :notice => "Logout successful!")
  end
end