class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    if @contact.save
      flash[:notice] = 'Message sent!'
      redirect_to '/contact'
    else
      flash[:error] = 'Please fix the errors and try again.'
      render :new
    end
  end
end
