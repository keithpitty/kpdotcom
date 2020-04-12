class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if valid_input?
      @contact.save
      ContactMailer.contact_message(@contact).deliver_now
      flash[:notice] = 'Message sent!'
      redirect_to '/contact'
    else
      render :new
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :subject, :message)
  end

  def valid_input?
    flash.clear
    flash[:error] = 'Spam detected' if params[:honeypot].length > 0
    flash[:error] = 'Spam detected. If you are human, try entering a message without a hyperlink.' if params[:contact][:message] =~ /(<a href=)|(http:\/\/)|(https:\/\/)/
    flash[:error] = 'Please fix the errors and try again.' unless @contact.valid?
    flash[:error].nil?
  end
end
