module Admin
  # Public: Controller for administration of testimonials.
  # Facilitates CRUD actions.
  class TestimonialsController < AdminLayoutController
    before_action :require_user

    def index
      @testimonials = Testimonial.all
    end

    def new
      @testimonial = Testimonial.new
    end

    def create
      @testimonial = Testimonial.new(testimonial_params)
      if @testimonial.save
        expire_testimonials_cache
        flash[:notice] = 'Testimonial created.'
        redirect_to admin_testimonials_url
      else
        render 'new'
      end
    end

    def edit
      @testimonial = Testimonial.find(params[:id])
    end

    def update
      @testimonial = Testimonial.find(params[:id])
      @testimonial.update_attributes(testimonial_params)
      if @testimonial.save
        expire_testimonials_cache
        flash[:notice] = 'Testimonial updated.'
        redirect_to admin_testimonials_url
      else
        render 'edit'
      end
    end

    def destroy
      @testimonial = Testimonial.find(params[:id])
      flash[:notice] = 'Testimonial deleted.'
      @testimonial.destroy
      expire_testimonials_cache
      redirect_to admin_testimonials_url
    end

    private

    def testimonial_params
      params.require(:testimonial).permit(:provider_name, :provider_position, :recommendation, :rank)
    end

    def expire_testimonials_cache
      expire_fragment "testimonials" 
    end
  end
end
