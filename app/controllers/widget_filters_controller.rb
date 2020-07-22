class WidgetFiltersController < ApplicationController
  def new
    @widget_filter = view_settings.filter
  end

  private

  def permitted_params
    params.fetch(:widget_view_settings, {})
          .permit(:search, :order, filter_attributes: %i[category colour size])
  end

  def view_settings
    @view_settings ||= begin
      attrs = {
        accessible_categories: accessible_categories,
        accessible_colours: accessible_colours,
        accessible_sizes: accessible_sizes
      }
      WidgetViewSettings.new permitted_params.merge(attrs)
    end
  end
  helper_method :view_settings

  def accessible_categories
    @accessible_categories ||= begin
      logger.warn "TODO: create accessible_categories scope here (hint: need current_user + maybe pundit)"
      Category.all
    end
  end

  def accessible_colours
    @accessible_colours ||= begin
      Colour.all
    end
  end

  def accessible_sizes
    @accessible_sizes ||= begin
      Size.all
    end
  end
end
