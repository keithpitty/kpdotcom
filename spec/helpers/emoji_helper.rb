require 'rails_helper'

describe EmojiHelper, type: :helper do
  describe '#emojify' do
    it "translates :coffee:" do
      expected = "<img alt=\"coffee\" src=\"/images/emoji/unicode/2615.png\" style=\"vertical-align:middle\" width=\"20\" height=\"20\" />"
      actual = emojify(":coffee:")
      expect(actual).to eq(expected)
    end

    it "preserves a textile link" do
      expected = "\"GitHub\":http://github.com"
      actual = emojify("\"GitHub\":http://github.com")
      expect(actual).to eq(expected)
    end
  end
end
