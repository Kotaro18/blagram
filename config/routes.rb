Rails.application.routes.draw do
  devise_for :users, # ここの行にカンマを追加
    controllers: { registrations: 'registrations' } # ここの行を追加

  root 'posts#index'
  # rootルーティングを設定する。

  get '/users/:id', to: 'users#show', as: 'user'

  resources :posts, only: %i(new create index show) do
    # indexを追加するだけで、一覧ページへのルートが作成される。
    resources :photos, only: %i(create)
  end
  # photosをネスト(入れ子)にすることで、postsと親子関係を紐づけられる。
end
