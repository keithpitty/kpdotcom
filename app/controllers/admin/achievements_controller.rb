module Admin
  # Public: Controller for adminstration of achievements.
  # Facilitate CRUD actions.
  class AchievementsController < AdminLayoutController
    before_filter :require_user
    cache_sweeper :achievement_sweeper, only: [:create, :update, :destroy]

    def index
      @achievements = Achievement.all
    end

    def new
      @achievement = Achievement.new
    end

    def create
      @achievement = Achievement.new(params[:achievement])
      begin
        @achievement.save!
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
      @achievement.update_attributes(params[:achievement])
      if @achievement.save
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
  end
end
