class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    @validator = ContactMessageValidator.new(
      honeypot: params[:content],
      contact: @contact,
      message: params[:contact][:message])
    if valid_input?
      @contact.save
      ContactMailer.contact_message(@contact).deliver_now
      flash[:notice] = 'Message sent!'
      redirect_to '/contact'
    else
      flash[:error] = @validator.error_message
      render :new
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :subject, :message)
  end

  def valid_input?
    @validator.valid?
  end
end
