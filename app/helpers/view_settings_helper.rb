module ViewSettingsHelper
  # Like simple_form_for but using custom form builder
  def view_settings_form(options = {}, &block)
    default_options = { 
      method: 'get', 
      enforce_utf8: false, 
      wrapper: :bulma,
      builder: ViewSettingsFormBuilder 
    }
    simple_form_for(view_settings, default_options.merge(options)) do |f|
      f.generate_hidden_fields + capture(f, &block)
    end
  end
end
