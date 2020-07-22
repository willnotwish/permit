class WidgetsController < ApplicationController
  def index
    @widgets = view_settings.refine_scope(base_scope.includes(:category))
  end

  def show
    @widget = base_scope.find params[:id]
  end

  private

  # Do it like this in case the base scope is restricted.
  # Likely in a public facing controller.
  def base_scope
    Widget.all
  end

  def permitted_params
    params.fetch(:widget_view_settings, {})
          .permit(:search, :order, filter_attributes: %i[category colour size])
  end

  def view_settings
    @view_settings ||= WidgetViewSettings.new(permitted_params)
  end
  helper_method :view_settings
end
