# coding: utf-8

class Admin::AchievementsController < AdminLayoutController

  before_filter :require_user
  cache_sweeper :achievement_sweeper, :only => [:create, :update, :destroy]

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
      flash[:notice] = 'Achievement created'
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
    begin
      @achievement.update_attributes(params[:achievement])
      flash[:notice] = 'Achievement updated'
      redirect_to admin_achievements_url
    rescue
      render 'edit'
    end
  end

  def destroy
    Achievement.destroy(params[:id])
    redirect_to admin_achievements_url
  end

  protected
    def set_section
      @section = "admin_achievements"
    end
end