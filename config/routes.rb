Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'restaurants' => 'restaurants#index'
  resources :restaurants do
    resources :reviews
  end

  get 'restaurants/new' => 'restaurants#new'

  get 'restaurants/restaurant_id/reviews/new' => 'reviews#new'
  
end
