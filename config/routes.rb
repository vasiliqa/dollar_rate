Rails.application.routes.draw do
  root 'rates#show'
  get '/admin' => 'forced_rates#edit', as: :admin
  post '/admin' => 'forced_rates#update'
  patch '/admin' => 'forced_rates#update'
end
