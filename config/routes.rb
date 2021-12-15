Rails.application.routes.draw do
#posts
resources :posts
#comments
resources :comments
#auth
resources :users

post '/login', to: 'users#login'

post '/posts/search', to: 'posts#search'

end
