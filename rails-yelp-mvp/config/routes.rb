Rails.application.routes.draw do
  root to: "pages#home"
  resources :restaurants, only: [:index, :new, :create, :show] do
    resources :reviews, only: [:new, :create]
  end
end
