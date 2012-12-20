class DatepickerInput < SimpleForm::Inputs::Base
  def input
    input_html_options[:data] ||= {}
    input_html_options[:data][:birth_date] = true if options[:birth_date]
    @builder.text_field(attribute_name, input_html_options)
  end
end
