class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      ContactMailer.contact_message(@contact).deliver_now
      flash[:notice] = 'Message sent!'
      redirect_to '/contact'
    else
      flash[:error] = 'Please fix the errors and try again.'
      render :new
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :subject, :message)
  end
end
