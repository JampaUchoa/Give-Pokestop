Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'map#main'
  post '/candidate/submit', to: 'candidate#create'
  get '/candidate', to: 'candidate#show'
  get '/auth/:provider/callback', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

end
