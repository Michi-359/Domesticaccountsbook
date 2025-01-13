Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  get "users/show" => "users#show"
  root to: 'home#index'
  resources :budgetbooks
  resources :progresses
  resources :posts do
    collection do
      get :mypost
    end
  end
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end

  get "up" => "rails/health#show", as: :rails_health_check
end
