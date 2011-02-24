# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  include TagsHelper 
  
  def textilize(text)  
    RedCloth.new(text).to_html.html_safe unless text.blank?  
  end
  
  def coderay(text)
    text.gsub(/\<code( lang="(.+?)")?\>(.+?)\<\/code\>/m) do
      content_tag("notextile", CodeRay.scan($3, $2).div(:css => :class))
    end
  end
  
end
