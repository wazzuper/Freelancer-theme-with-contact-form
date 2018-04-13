Rails.application.routes.draw do
  root 'home#welcome'
  resources :contacts, only: [:create]
end
