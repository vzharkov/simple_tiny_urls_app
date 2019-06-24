Rails.application.routes.draw do
  resources :urls
  get '/u/:token', to: 'urls#show', as: 'u'

  root to: 'urls#index'
end
