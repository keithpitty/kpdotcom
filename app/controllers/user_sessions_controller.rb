class UserSessionsController < AdminLayoutController
  before_action :require_no_user, only: [:create]
  before_action :require_user, only: :destroy

  def new
    if current_user
      redirect_to admin_url
    else
      @user_session = UserSession.new
    end
  end

  def create
    @user_session = UserSession.new(user_session_params.to_h)
    if @user_session.save
      logger.info 'User session created.'
      msg = 'Login successful!'
      redirect_to(admin_url, notice: msg)
    else
      flash[:error] = 'Bad credentials, man!'
      render :new
    end
  end

  def destroy
    current_user_session.destroy
    redirect_to(login_url, notice: 'Logout successful!')
  end

  private

  def user_session_params
    params.require(:user_session).permit(:login, :password)
  end
end
