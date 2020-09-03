Rails.application.routes.draw do

  namespace :admin do
    get 'sections/index'
  end
  devise_for :users



  namespace :admin do
    root 'application#index'

    resources :users do
      resources :projects
    end

    resources :sections, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: "pages#home"
end
