class WidgetFiltersController < ApplicationController
  def new
    @widget_filter = view_settings.filter
  end

  private

  def permitted_params
    params.fetch(:widget_view_settings, {})
          .permit(:search, :order, filter_attributes: [:category])
  end

  def view_settings
    @view_settings ||= WidgetViewSettings.new(permitted_params.merge(accessible_categories: accessible_categories))
  end
  helper_method :view_settings

  def accessible_categories
    @accessible_categories ||= begin
      logger.warn "TODO: create accessible_categories scope here (hint: need current_user + maybe pundit)"
      Category.all
    end
  end
end
