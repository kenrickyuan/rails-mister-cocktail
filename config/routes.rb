Rails.application.routes.draw do
  resources :cocktails, only: [:create, :new, :index, :show, :destroy] do
    resources :doses, only: [:create, :destroy]
  end
end
