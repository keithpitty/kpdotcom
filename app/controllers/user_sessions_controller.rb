class UserSessionsController < ApplicationController
  before_filter :require_no_user, :only => [:create]
  before_filter :require_user, :only => :destroy
  
  def index
    if current_user
      redirect_to admin_url
    else
      @user_session = UserSession.new
      @home = true
    end
  end

  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      logger.info "User session created."
      msg = "Login successful!"
      redirect_to(admin_url, :notice => msg)
    else
      @home = true
      render :action => :index
    end
  end

  def destroy
    current_user_session.destroy
    redirect_to(root_url, :notice => "Logout successful!")
  end
end
