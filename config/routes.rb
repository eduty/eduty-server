Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  controller :ping do
    get '/ping' => :pong
  end

  controller :user do
    post '/auth' => :auth
  end

  controller :payment do
    post '/pay' => :pay
  end

  resources :institutions, only: [:index, :show] do
    resources :campuses, only: [:index] do
      resources :courses, only: [:index]
    end
  end

  resources :campuses, :courses, only: [:show]
end
