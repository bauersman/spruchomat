Spruchomat::Application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root 'home#index'

  resources :parties, only: %w(index show)

  resources :runs, only: %w(new show) do
    member do
      post :answer
    end
  end
end
