Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  controller :ping do
    get '/ping' => :pong
  end

  controller :users do
    post '/auth' => :auth
  end

  controller :payment do
    post '/pay' => :pay
  end

  resources :users, only: [:create]

  resources :institutions, only: [:index, :show] do
    resources :campuses, only: [:index]
  end

  resources :campuses, only: [:show] do
    resources :courses, only: [:index]
  end

  resources :courses, only: [:show]
end
