Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resource :session, only: [:create, :new, :destroy]
  resources :users, only: [:new, :create, :show, :index] do
    resources :subs, except: [:destroy] 
  end
  
  resources :posts, except: [:index]

  # get "subs/post", to: ""
end
