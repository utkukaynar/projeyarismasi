Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'welcome#index'

  devise_for :users
  resources :admissions do
    resources :build, controller: "admissions/build"
    resources :reviews do
      resources :build, controller: "reviews/build"
    end
  end

  get "reviews/my_reviews", to: "reviews#my_reviews", as: 'my_reviews'
end
