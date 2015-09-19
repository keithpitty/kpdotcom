# coding: utf-8

# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  include ActsAsTaggableOn::TagsHelper
  include EmojiHelper

  def textilize(text)
    RedCloth.new(emojify(text)).to_html.html_safe unless text.blank?
  end

  def coderay(text)
    text.gsub(/^\<code(?: lang='(.+?)')?\>(.+?)\<\/code\>/m) do
      lang = $1 || 'text'
      code = $2
      "\n<notextile>#{CodeRay.scan(code, lang).div(css: :class)}</notextile>"
    end
  end

  def navbar_item(label, link)
    if active_link?(label)
      content_tag(:li, link_to(label, link), class: 'active')
    else
      content_tag(:li, link_to(label, link))
    end
  end

  def active_link?(label)
    controller_name == label.downcase || exceptional_active_link?(label)
  end

  def exceptional_active_link?(label)
    (controller_name == 'contacts' && label == 'Contact') ||
      (controller_name == 'archives' && label == 'Blog') ||
      (controller_name == 'tags' && label == 'Blog')
  end
end
