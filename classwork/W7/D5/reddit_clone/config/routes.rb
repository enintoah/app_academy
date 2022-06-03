Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :show, :new, :edit, :create, :update, :destroy] 
  resource :session, only: [:new, :create, :destroy]
  resources :subs, only: [:index, :show, :new, :edit, :create, :update] do
    resources :posts, only: [:new, :create]
  end
  resources :posts, except: [:index]
end
