module ViewSettingsHelper
  def view_settings_form_for(record, options = {}, &block)
    simple_form_for(record, options.merge(builder: ViewSettingsFormBuilder)) do |form_builder|
      hidden_params = form_builder.generate_hidden_inputs
      hidden_params + capture(form_builder, &block)
    end
  end

  def view_settings_search_form(options = {}, &block)
    local_options = { url: :widgets, method: 'get', enforce_utf8: false }
    view_settings_form_for(view_settings, local_options.merge(options), &block)
  end
end
