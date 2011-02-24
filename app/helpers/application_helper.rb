# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  include TagsHelper 
  
  def textilize(text)  
    RedCloth.new(text).to_html.html_safe unless text.blank?  
  end
  
  def coderay(text)
    text.gsub(/^\<code(?: lang='(.+?)')?\>(.+?)\<\/code\>/m) do
      "\n<notextile>#{CodeRay.scan($2, $1).div(:css => :class)}</notextile>"
    end
  end
  
end
