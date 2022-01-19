Rails.application.routes.draw do
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show]
  end

  root to: "users#index"

  get '/posts/new' => 'posts#new'
  post '/posts' => 'posts#create'
end
