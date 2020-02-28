Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :bloggers
  resources :destinations
  resources :posts

  post '/posts/:id/like_post', to: 'posts#like_post'
  post '/posts/:id/dislike_post', to: 'posts#dislike_post'
end
