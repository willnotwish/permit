class WidgetFiltersController < ApplicationController
  def new
    @widget_filter = WidgetFilter.new widget_filter_params
  end

  private

  def widget_filter_params
    params.fetch(:widget_filter, {})
          .permit(:category)
  end

  def permitted_params
    params.fetch(:widget_view_settings, {})
          .permit(:search, :order, filter_attributes: [:category])
  end

  def view_settings
    @view_settings ||= WidgetViewSettings.new(permitted_params)
  end
  helper_method :view_settings
end
