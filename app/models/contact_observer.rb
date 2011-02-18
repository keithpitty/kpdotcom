class ContactObserver < ActiveRecord::Observer
  def after_create(contact)
    ContactMailer.contact_message(contact).deliver
  end
end
