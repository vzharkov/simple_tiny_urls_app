Rails.application.routes.draw do
  resources :urls
  get '/u/:token', to: 'redirects#show', as: 'u'

  root to: 'urls#index'
end
