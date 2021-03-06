# coding: utf-8

# Method to translate emoji text into image
module EmojiHelper
  def emojify(content)
    content.to_str.gsub(/:([\w+-]+):/) do |match|
      if emoji = Emoji.find_by_alias($1)
        %(<img alt="#$1" src="#{image_path("emoji/#{emoji.image_filename}", skip_pipeline: true)}" style="vertical-align:middle" width="20" height="20" />)
      else
        match
      end
    end if content.present?
  end
end
