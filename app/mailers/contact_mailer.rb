class ContactMailer < ActionMailer::Base
  default :to => "keith@keithpitty.com"
  
  def contact_message(contact)
    @message = contact.message
    @name = contact.name
    
    mail(:from => contact.email, :subject => "[Contact via keithpitty.com] #{contact.subject}")
  end

end
