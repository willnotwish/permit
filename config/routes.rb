Rails.application.routes.draw do
  resources :widgets, only: [:index, :show]
  resources :widget_filters, only: [:new]
end
