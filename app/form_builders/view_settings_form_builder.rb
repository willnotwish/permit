class ViewSettingsFormBuilder < SimpleForm::FormBuilder
  def generate_hidden_fields
    hidden_inputs_for(object.attributes, self)
      .flatten
      .join(' ')
      .html_safe
  end

  def hidden_inputs_for(attrs, builder)
    inputs = []
    attrs.keys.collect do |attr_name|
      if attr_name =~ /(.+)_attributes/
        child = $1
        Rails.logger.debug "hidden_inputs_for. child: #{child}"
        builder.simple_fields_for(child) do |cb|
          inputs << hidden_inputs_for(builder.object.send(child).attributes, cb)
        end
      else
        inputs << builder.input(attr_name, as: :hidden, wrapper: false)
      end
    end
    inputs
  end
end
