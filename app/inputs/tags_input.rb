class TagsInput < SimpleForm::Inputs::Base
  def input(wrapper_options)
    (@builder.text_field(attribute_name,
                         input_html_options.merge(value: object.tag_list.to_s))).html_safe
  end
end
