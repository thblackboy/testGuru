Rails.application.routes.draw do
  get :logout, to: 'sessions#destroy'
  get :login, to: 'sessions#new'
  get :signup, to: 'users#new'

  resources :users, only: :create
  resources :sessions, only: :create

  resources :tests do
    resources :questions, shallow: true, except: :index do
      resources :answers, shallow: true, except: :index
    end
    member do
      post :start
    end
  end

  resources :test_passages, only: %i[show update] do
    member do
      get :result
    end
  end

  root to: 'tests#index'
end
