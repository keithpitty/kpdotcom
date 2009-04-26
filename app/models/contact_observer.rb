class ContactObserver < ActiveRecord::Observer
  def after_create(contact)
    ContactMailer.deliver_contact_message(contact)
  end
end
