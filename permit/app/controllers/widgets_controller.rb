class WidgetsController < ApplicationController
  def index
    @widgets = view_settings.apply_scope Widget.all
  end

  def show
    @widget = Widget.find params[:id]
  end

  private

  def permitted_params
    params.fetch(:widget_view_settings, {}).permit(:search, :order)
  end

  def view_settings
    @view_settings ||= WidgetViewSettings.new(permitted_params)
  end
  helper_method :view_settings
end
