Rails.application.routes.draw do
  
  # ルート/にアクセスしたら
  # toppagesコントロールのindexアクションが動いて
  # 表示はtoppages/index.html.erbだよ
  root to: 'toppages#index'
  
  
  
  # ルート/signupにアクセスしたら
  # usersコントロールのnewアクションが動いて
  # 表示はusers/new.html.erbだよ
  get 'signup', to: 'users#new'
  resources :users, only: [:show, :new, :create]
  
end
