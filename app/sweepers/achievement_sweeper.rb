# coding: utf-8

class AchievementSweeper < ActionController::Caching::Sweeper
  observe Achievement
  
  def after_save(achievement)
    expire_cache_for(achievement)
  end
  
  def after_destroy(achievement)
    expire_cache_for(achievement)
  end
  
  private
  def expire_cache_for(record)
    expire_page "/about.html"
  end
end