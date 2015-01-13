require 'rails_helper'

describe ApplicationHelper, type: :helper do
  describe '#navbar_item' do
    it 'derives active navbar item' do
      allow(controller).to receive(:controller_name).and_return('contacts')
      actual = navbar_item('Contact', '/contact')
      expected = '<li class="active"><a href="/contact">Contact</a></li>'
      expect(actual).to eq(expected)
    end

    it 'derives non-active navbar item' do
      actual = navbar_item('Contact', '/contact')
      expect(actual).to eq('<li><a href="/contact">Contact</a></li>')
    end
  end
end
