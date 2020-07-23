class WidgetsController < ApplicationController
  # include HasScopeRefinement
  include HasViewSettings

  has_view_settings_for :widgets, class_name: 'WidgetViewSettings'

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

  def view_settings_params
    params.fetch(:widget_view_settings, {})
          .permit(:search, :order, filter_attributes: %i[category colour size])
  end
end
