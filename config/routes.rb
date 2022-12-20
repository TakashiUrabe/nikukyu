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

  #サイトマップ
  get '/sitemap', to: redirect("https://s3-ap-northeast-1.amazonaws.com/#{ENV['S3_BUCKET_NAME']}/sitemaps/sitemap.xml.gz")

  #プロフィールカード
  get 'result/:id', to: 'results#result'
  resources :profile_cards, only: %i[new index create edit update] do
    member do
      get 'download/:card_type', to: 'downloads#download'
      get :tweet_a, to: 'tweets#tweet_a'
      get :tweet_b, to: 'tweets#tweet_b'
      get :tweet_c, to: 'tweets#tweet_c'
      get :tweet_d, to: 'tweets#tweet_d'
      get :tweet_e, to: 'tweets#tweet_e'
      get :tweet_f, to: 'tweets#tweet_f'
    end
  end
  resource :my_pages, only: %i[show]
end
