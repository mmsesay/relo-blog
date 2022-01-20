Rails.application.routes.draw do
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create] do
      resources :comments, only: [:new, :create]
    end
  end

  root to: "users#index"

  # get '/posts/new' => 'posts#new'
  # post '/posts' => 'posts#create'
  # get '/posts/:post_id/comment/new' => 'comments#new'
  # post '/posts/:post_id/comment' => 'comments#create'
end
