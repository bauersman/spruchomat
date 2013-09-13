Spruchomat::Application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root 'home#index'

  resources :parties
  resources :posters

  resources :runs do
    member do
      post :answer
    end
  end
end
