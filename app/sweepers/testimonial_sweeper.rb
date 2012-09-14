# coding: utf-8

class TestimonialSweeper < ActionController::Caching::Sweeper
  observe Testimonial
  
  def after_save(testimonial)
    expire_cache_for(testimonial)
  end
  
  def after_destroy(testimonial)
    expire_cache_for(testimonial)
  end
  
  private
  def expire_cache_for(record)
    expire_page "/about.html"
  end
end