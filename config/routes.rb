Rails.application.routes.draw do
  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'
  root to: 'welcome_pages#top'

  resources :users, only: %i[create]
  resources :password_resets, only: %i[new create edit update]
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
  resources :profile_cards
  resources :profile_cards do
    get :download, on: :member
  end
end
