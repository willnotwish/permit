class ViewSettingsFormBuilder < SimpleForm::FormBuilder
  def generate_hidden_inputs
    attrs = object.attributes
    attrs.keys.collect do |attr_name|
      input attr_name, as: :hidden if attrs[attr_name].present?
    end.join(' ').html_safe
  end
end