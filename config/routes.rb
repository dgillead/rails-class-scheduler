Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }
  root to: 'home#index'

  resources :studios do
    resources :events
  end
  resources :event_participants
end
