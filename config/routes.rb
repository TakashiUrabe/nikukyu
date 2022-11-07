Rails.application.routes.draw do
  # トップページ
  root to: 'welcome_pages#top'

  # ユーザー登録・ログイン・ログアウト・設定
  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'
  resources :users, only: %i[create]

  #パスワードリセット
  resources :password_resets, only: %i[new create edit update]
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?

  #プロフィールカード
  resources :profile_cards
  resources :profile_cards do
    get :download, on: :member
  end

  # 静的ページ
  get '/terms_of_service', to: 'static_pages#terms_of_service'
  get '/privacy_policy', to: 'static_pages#privacy_policy'
end
