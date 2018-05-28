Rails.application.routes.draw do
  get ENV['APP_OAUTH_CALLBACK'] => 'sessions#create'
  get '/logout' => 'sessions#destroy', as: 'logout'
  get ENV['APP_OAUTH_REQUEST_PATH'], to: lambda{ |env| [404, {}, ["Not Found"]] }, as: 'auth'

  get '/authorize' => 'oauth#index', as: 'authorize'

  get '/profile' => 'profile#show', as: 'profile'
  root 'profile#show'
end
