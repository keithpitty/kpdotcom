module Admin
  # Public: Controller for adminstration of achievements.
  # Facilitate CRUD actions.
  class AchievementsController < AdminLayoutController
    before_action :require_user

    def index
      @achievements = Achievement.all
    end

    def new
      @achievement = Achievement.new
    end

    def create
      @achievement = Achievement.new(achievement_params)
      begin
        @achievement.save!
        expire_achievements_fragment
        flash[:notice] = 'Achievement created.'
        redirect_to admin_achievements_url
      rescue
        render 'new'
      end
    end

    def edit
      @achievement = Achievement.find(params[:id])
    end

    def update
      @achievement = Achievement.find(params[:id])
      @achievement.update_attributes(achievement_params)
      if @achievement.save
        expire_achievements_fragment
        flash[:notice] = 'Achievement updated.'
        redirect_to admin_achievements_url
      else
        render 'edit'
      end
    end

    def destroy
      Achievement.destroy(params[:id])
      flash[:notice] = 'Achievement deleted.'
      redirect_to admin_achievements_url
    end

    private

    def achievement_params
      params.require(:achievement).permit(:rank, :heading, :description)
    end

    def expire_achievements_fragment
      expire_fragment "achievements"
    end
  end
end
