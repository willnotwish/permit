class WidgetFiltersController < ApplicationController
  include HasViewSettings

  has_view_settings_for :widgets, class_name: 'WidgetViewSettings'

  def new
    @widget_filter = view_settings.filter
  end

  private

  def view_settings_params
    params.fetch(:widget_view_settings, {})
          .permit(:search, :order, filter_attributes: %i[category colour size])
  end

  # def view_settings
  #   @view_settings ||= 
  #     WidgetViewSettings.new permitted_params.merge(current_user: current_user)
  # end
  # helper_method :view_settings
end
