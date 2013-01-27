# coding: utf-8

class Admin::TestimonialsController < AdminLayoutController

  before_filter :require_user
  cache_sweeper :testimonial_sweeper, :only => [:create, :update, :destroy]

  def index
    @testimonials = Testimonial.all
  end

  def new
    @testimonial = Testimonial.new
  end

  def create
    @testimonial = Testimonial.new(params[:testimonial])
    begin
      @testimonial.save!
      flash[:notice] = 'Testimonial was successfully created!'
      redirect_to admin_testimonials_url
    rescue
      render 'new'
    end
  end

  def edit
    @testimonial = Testimonial.find(params[:id])
  end

  def update
    @testimonial = Testimonial.find(params[:id])
    begin
      @testimonial.update_attributes!(params[:testimonial])
      flash[:notice] = 'Testimonial was succesfully updated!'
      redirect_to admin_testimonials_url
    rescue
      render 'edit'
    end
  end

  def destroy
    @testimonial = Testimonial.find(params[:id])
    @testimonial.destroy
    redirect_to admin_testimonials_url
  end

  protected
    def set_section
      @section = "admin_testimonials"
    end
end