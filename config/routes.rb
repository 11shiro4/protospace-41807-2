Rails.application.routes.draw do
  devise_for :users #ログイン系
  resources :users, only: [:show]#消さないルーティング

  resources :prototypes do #７つのアクション
   resources :comments, only: :create
  end

  root to: "prototypes#index"
end