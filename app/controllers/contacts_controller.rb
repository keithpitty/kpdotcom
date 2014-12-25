# coding: utf-8

class ContactsController < ApplicationController

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    if @contact.save
      flash[:notice] = "Message sent!"
      redirect_to '/contact'
    else
      flash[:error] = @contact.errors.full_messages
      render "new"
    end
  end

end
