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
    return 'Spam detected.' if spam_detected?
    return 'Spam detected. If you are human, try entering a message without a hyperlink.' if @message =~ /(<a href=)|(http:\/\/)|(https:\/\/)/
    return 'Please fix the errors and try again.' unless @contact.valid?
    ''
  end

  private

  def spam_detected?
    (@honeypot.length > 0) || (@message =~ /(@Cryptaxbot lorinoke)|(money)|(financial)/)
  end
end
