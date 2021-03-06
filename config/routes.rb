Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  controller :ping do
    get '/ping' => :pong
  end

  controller :users do
    get '/users/:slug' => :show
    post '/auth' => :auth
  end

  controller :payment do
    post '/pay' => :pay
  end

  resources :users, only: [:create, :index] do
    resources :campaigns, only: [:create]
  end

  resources :campaigns, only: [:index, :show]

  resources :institutions, only: [:index, :show] do
    resources :campuses, only: [:index]
  end

  resources :campuses, only: [:show]

  resources :courses, only: [:index, :show]
end
