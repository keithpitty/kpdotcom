class ContactController < ApplicationController

  caches_page :index

  def index
    @section = 'contact'
    @contact = Contact.new
  end
  
  def create
    @contact = Contact.new(params[:contact])
    if @contact.save
      flash[:notice] = "Message sent!"
      redirect_to '/contact'
    else
      render :action => "index"
    end
  end
  
end
