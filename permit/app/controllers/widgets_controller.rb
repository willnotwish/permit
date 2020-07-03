class WidgetsController < ApplicationController
  def index
    @widgets = Widget.all
  end

  def show
    @widget = Widget.find params[:id]
  end
end
