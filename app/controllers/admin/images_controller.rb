module Admin
  # Public: Controller for administration of images.
  # Facilitates creation and removal of images.
  class ImagesController < AdminLayoutController
    before_filter :require_user

    def index
      @images = Image.all
    end

    def new
      @image = Image.new
    end

    def create
      @image = Image.create(image_params)
      flash[:notice] = 'Image saved.'
      redirect_to admin_images_url
    end

    def destroy
      image = Image.find(params[:id])
      image.destroy
      flash[:notice] = 'Image deleted.'
      redirect_to admin_images_path
    end

    private

    def image_params
      params.require(:image).permit(:picture_file_name, :picture_content_type, :picture_file_size)
    end
  end
end
