class WidgetsController < ApplicationController
  def index
    @widgets = Widget.all

    order = params[:order]
    if order == 'price'
      @widgets = @widgets.order(:price)
    elsif order == 'name'
      @widgets = @widgets.order(:name)
    end
    
    search_term = params[:search]
    if search_term.present?
      @widgets = @widgets.search(search_term)
    end
  end

  def show
    @widget = Widget.find params[:id]
  end
end
