Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :projects, only: [:index]  do
    resources :todos, only: [:update]
  end
  resources :todos, only: [:create]

end
