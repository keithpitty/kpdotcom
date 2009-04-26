class AdminLayoutController < ApplicationController
  before_filter :login_required, :set_section
  
  def index
    
  end
  
  protected
    def set_section
      @section = "admin_home"
    end
end
