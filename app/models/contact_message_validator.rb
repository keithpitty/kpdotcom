class ContactMessageValidator

  def initialize(honeypot:, contact:, message:)
    @honeypot = honeypot
    @contact = contact
    @message = message
  end

  def valid?
    error_message == ''
  end

  def error_message
    return 'Spam detected' if @honeypot.length > 0
    return 'Spam detected. If you are human, try entering a message without a hyperlink.' if @message =~ /(<a href=)|(http:\/\/)|(https:\/\/)/
    return 'Please fix the errors and try again.' unless @contact.valid?
    ''
  end
end
