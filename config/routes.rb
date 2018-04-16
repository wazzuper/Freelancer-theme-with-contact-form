Rails.application.routes.draw do
  root 'home#welcome'
  resource :contacts, only: [:create]
end
