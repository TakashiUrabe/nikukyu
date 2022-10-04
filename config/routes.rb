Rails.application.routes.draw do
  root to: 'welcome_pages#top'

  resources :users, only: %i[new create]
end
