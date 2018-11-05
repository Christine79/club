Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    resources :users
    root to: 'users#home'

    get 'users', to: 'users#user'
    post '/user', to: 'users#new'
    post '/static_page', to: 'static_page#new'

#  get '/static_page/home', to: 'static_page#new'
#    get '/static_page/new', to: 'static_page#new'
#    get '/static_page/create', to: 'static_page#create'
#    get '/user/create', to: 'users#create'
#    get '/user/new', to: 'users#new'
#    get '/private_message/new', to: 'private_messages#new'
#    get '/private_message/create', to: 'private_messages#create'
#    get '/salut(/:name)' , to: 'static_page#salut'


      get '/static_page/home', to: 'static_page#home'
      get '/user/create', to: 'users#create'
      get '/user/new', to: 'users#new'
      get '/salut(/:name)' , to: 'users#salut'



end
