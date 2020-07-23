class WidgetsController < ApplicationController
  include HasViewSettings

  has_view_settings_for :widgets, class_name: 'WidgetViewSettings'

  def index
    @widgets = base_scope
    
    # Filter
    @widgets = view_settings.filter.apply(@widgets)

    # Quick search
    if view_settings.search.present?
      wildcard = "%#{view_settings.search}%"
      @widgets = @widgets.where(Widget.arel_table[:name].matches(wildcard))
    end

    # Display order
    order = view_settings.order
    if order == 'price_low_to_high'
      @widgets = @widgets.order(price: :asc)
    elsif order == 'price_high_to_low'
      @widgets = @widgets.order(price: :desc)
    elsif order == 'name'
      @widgets = @widgets.order(:name)
    end

    # N+1 queries (eager loading)
    @widgets = @widgets.includes(:category, :colour, :size)
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
