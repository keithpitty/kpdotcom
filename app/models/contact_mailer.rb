class ContactMailer < ActionMailer::Base
  def contact_message(contact)
    @recipients = "keith@keithpitty.com"
    @from = "#{contact.email}"
    @subject = "[Contact via keithpitty.com] #{contact.subject}"
    @sent_on = Time.now
    @body[:message] = "#{contact.message}"
    @body[:name] = "#{contact.name}"
  end

end
