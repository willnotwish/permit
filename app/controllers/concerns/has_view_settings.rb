module HasViewSettings
  extend ActiveSupport::Concern

  included do
    helper_method :view_settings
  end

  def view_settings
    @view_settings ||= WidgetViewSettings.new(view_settings_params.merge(current_user: current_user))
  end

  class_methods do
    def has_view_settings_for(resource_name, options={})
      logger.warn "TODO. Implement has_view_settings_for..."
    end
  end
end
