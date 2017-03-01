Rails.application.routes.draw do
  mount ActionCable.server => '/cable'

  root 'rates#show'
  get '/admin' => 'forced_rates#edit', as: :admin
  post '/admin' => 'forced_rates#update'
  patch '/admin' => 'forced_rates#update'

  require 'sidekiq/web'
  mount Sidekiq::Web => 'sidekiq'
end
