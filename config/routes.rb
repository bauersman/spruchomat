Spruchomat::Application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root 'home#index'

  resources :parties, only: %w(index show)

  resources :runs, only: %w(new show) do
    collection do
      get :start, :start_easy
    end

    member do
      post :answer
    end
  end
end
