require 'rails_helper'

describe ContactMessageValidator do

  def valid_contact
    Contact.new(
      name: 'Joe Bloggs',
      email: 'joe@bloggs.com',
      subject: 'A Genuine Enquiry',
      message: 'This is a valid message'
    )
  end

  def invalid_contact
    Contact.new(
      name: '',
      email: '',
      subject: '',
      message: ''
    )
  end

  describe '#valid?' do
    context 'has a valid contact and message' do
      it 'is valid' do
        validator = ContactMessageValidator.new(
          honeypot: '',
          contact: valid_contact,
          message: 'This is a valid message.'
        )
        expect(validator).to be_valid
      end
    end

    context 'has honeypot content' do
      it 'is invalid' do
        validator = ContactMessageValidator.new(
          honeypot: 'content',
          contact: valid_contact,
          message: 'This is a valid message.'
        )
        expect(validator).to_not be_valid
      end
    end

    context 'has a hyperlink in the message' do
      it 'is invalid' do
        validator = ContactMessageValidator.new(
          honeypot: '',
          contact: valid_contact,
          message: 'This is a message with a hyperlink. See https://buysnakeoil.com'
        )
        expect(validator).to_not be_valid
      end
    end

    context 'has an invalid contact' do
      it 'is invalid' do
        validator = ContactMessageValidator.new(
          honeypot: '',
          contact: invalid_contact,
          message: ''
        )
        expect(validator).to_not be_valid
      end
    end

    context 'has a message which is known to be spam: @Cryptaxbot lorinoke' do
      it 'is invalid' do
        validator = ContactMessageValidator.new(
          honeypot: '',
          contact: valid_contact,
          message: 'Make dollars just sitting home. Telegram - @Cryptaxbot lorinoke'
        )
        expect(validator).to_not be_valid
      end
    end
  end

  describe '#error_message' do
    context 'has honeypot content' do
      it 'is invalid' do
        validator = ContactMessageValidator.new(
          honeypot: 'content',
          contact: valid_contact,
          message: 'This is a valid message.'
        )
        expect(validator.error_message).to eq('Spam detected.')
      end
    end

    context 'has a hyperlink in the message' do
      it 'is invalid' do
        validator = ContactMessageValidator.new(
          honeypot: '',
          contact: valid_contact,
          message: 'This is a message with a hyperlink. See https://buysnakeoil.com'
        )
        expect(validator.error_message).to eq('Spam detected. If you are human, try entering a message without a hyperlink.')
      end
    end

    context 'has a message which is known to be spam: @Cryptaxbot lorinoke' do
      it 'is invalid' do
        validator = ContactMessageValidator.new(
          honeypot: '',
          contact: valid_contact,
          message: 'Make dollars just sitting home. Telegram - @Cryptaxbot lorinoke'
        )
        expect(validator.error_message).to eq('Spam detected.')
      end
    end
  end
end
