class ViewSettingsFormBuilder < SimpleForm::FormBuilder

  def initialize(object_name, object, template, options)
    super(object_name, object, template, options)
    # @nested_child_index = {}
    # @object_name, @object, @template, @options = object_name, object, template, options
    # @default_options = @options ? @options.slice(:index, :namespace) : {}
    # if @object_name.to_s.match(/\[\]$/)
    #   if object ||= @template.instance_variable_get("@#{Regexp.last_match.pre_match}") and object.respond_to?(:to_param)
    #     @auto_index = object.to_param
    #   else
    #     raise ArgumentError, "object[] naming but object param and @object var don't exist or don't respond to to_param: #{object.inspect}"
    #   end
    # end
    # @multipart = nil
    # @index = options[:index] || options[:child_index]
  end

  def generate_hidden_inputs
    Rails.logger.debug "About to generate hidden inputs"
    object.keys.collect do |attr_name|
      input attr_name, as: :hidden
    end.join(' ').html_safe
  end
end