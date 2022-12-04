Rails.application.routes.draw do
  # トップページ
  root to: 'welcome_pages#top'

  # ユーザー登録・ログイン・ログアウト・設定
  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'
  resources :users, only: %i[new create]

  #パスワードリセット
  resources :password_resets, only: %i[new create edit update]
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?

  #プロフィールカード
  get 'result/:id', to: 'profile_cards#result'
  resources :profile_cards, only: %i[new index create edit update] do
    member do
      get :download_a, to: 'downloads#download_a'
      get :download_b, to: 'downloads#download_b'
      get :download_c, to: 'downloads#download_c'
      get :download_d, to: 'downloads#download_d'
      get :tweet_a, to: 'tweets#tweet_a'
      get :tweet_b, to: 'tweets#tweet_b'
      get :tweet_c, to: 'tweets#tweet_c'
      get :tweet_d, to: 'tweets#tweet_d'
    end
  end
  resource :my_pages, only: %i[show]
end
