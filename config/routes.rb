Rails.application.routes.draw do

  devise_for :users



  namespace :admin do
    root 'application#index'

    resources :users do
      resources :projects
    end
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: "pages#home"
end
