Rails.application.routes.draw do
  
  # ルート/にアクセスしたら
  # toppagesコントロールのindexアクションが動いて
  # 表示はtoppages/index.html.erbだよ
  root to: 'toppages#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  
  # ルート/signupにアクセスしたら
  # usersコントロールのnewアクションが動いて
  # 表示はusers/new.html.erbだよ
  get 'signup', to: 'users#new'
  resources :users, only: [:show, :new, :create]
  
  # wantもhaveもownershipsの作成破棄で表現？
  resources :items, only: [:show, :new]
  resources :ownerships, only: [:create, :destroy]
  
  get 'rankings/want', to: 'rankings#want'
  
end
