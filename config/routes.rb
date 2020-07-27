Rails.application.routes.draw do
  resources :widgets, only: %i[index show]
  resource :widget_filter, only: :new
end
