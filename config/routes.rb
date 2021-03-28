Rails.application.routes.draw do
  devise_for :users
  root 'pages#home'

  get '/users/:id', to: 'users#show', as: 'user'
  # asで名前をつけると、user_pathというメソットが生成される。
end
