class ServicesController < ApplicationController
  before_filter :get_services
  caches_page :show
  
  def index
    @section = 'services'
    
    # Note: commenting out this code now that I am redirecting the visitor 
    # to the services section on the Cockatoo Software site.
    
    # first_service = Service.find :first, :order => 'rank'
    # if first_service
    #   redirect_to service_path(first_service)
    # else
    #   render
    # end
  end
  
  def show
    @section = 'services'
    @current_service = Service.find_by_name(params[:id])
    redirect_to services_path if @current_service.nil?
  end
  
  private
  
  def get_services
    @services = Service.find(:all, { :order => 'rank' })
  end
end
