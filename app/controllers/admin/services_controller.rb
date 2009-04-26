class Admin::ServicesController < AdminLayoutController
  
  cache_sweeper :service_sweeper, :only => [:create, :update, :destroy]

  def index
    @services = Service.find :all, :order => "rank"
  end
  
  def new
    @service = Service.new
  end
  
  def create
    @service = Service.new(params[:service])
    begin
      @service.save!
      flash[:notice] = 'Service was successfully created!'
      redirect_to admin_services_path
    rescue
      render :action => 'new'
    end
  end
  
  def edit
    @service = Service.find_by_name(params[:id])
  end
  
  def update
    @service = Service.find_by_name(params[:id])
    begin
      @service.update_attributes!(params[:service])
      flash[:notice] = 'Service was succesfully updated!'
      redirect_to admin_services_path
    rescue Exception => e
      logger.error(e)
      render :action => 'edit'
    end
  end
  
  def destroy
    @service = Service.find_by_name(params[:id])
    @service.destroy
    flash[:notice] = 'Service was succesfully deleted!'
    redirect_to admin_services_path
  end
  
  protected
    def set_section
      @section = "admin_services"
    end
end
