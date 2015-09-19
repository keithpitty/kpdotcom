require 'rails_helper'

describe EmojiHelper, type: :helper do
  describe '#emojify' do
    it "translates :coffee:" do
      expected = "<img alt=\"coffee\" src=\"/images/emoji/unicode/2615.png\" style=\"vertical-align:middle\" width=\"20\" height=\"20\" />"
      actual = emojify(":coffee:")
    end
  end
end
