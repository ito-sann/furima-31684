Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :items, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    resources :records, only: [:index, :create]
  end  
end
