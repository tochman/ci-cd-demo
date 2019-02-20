Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root controller: :articles, action: :index 

  resources :articles, only: [:index] do
    resources :comments, only: [:create]
  end
end
