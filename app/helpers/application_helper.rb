# coding: utf-8

# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
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
      link_to(label, link, class: 'text-white hover:text-white pr-4')
    else
      link_to(label, link, class: 'text-blue-300 hover:text-white pr-4')
    end
  end

  def active_link?(label)
    active_public_link?(label) || active_admin_link?(label)
  end

  def active_public_link?(label)
    (controller_name == label.downcase && action_name == 'index') || exceptional_active_link?(label)
  end

  def active_admin_link?(label)
    (request.path.include? 'admin') && (controller_name == label.downcase || exceptional_active_admin_link?(label))
  end

  def exceptional_active_link?(label)
    (controller_name == 'contacts' && label == 'Contact') ||
      (controller_name == 'archives' && action_name == 'show' && label == 'Blog')
  end

  def exceptional_active_admin_link?(label)
    ((controller_name == 'admin_layout') && label == 'Home') || ((controller_name == 'blog_posts') && label == 'Blog posts')
  end
end
