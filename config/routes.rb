Rails.application.routes.draw do

  devise_for :users, path: :gurus, path_names: {sign_in: :login, sign_out: :logout}, controllers: { sessions: 'users/sessions' }

  resources :tests, only: :index do
    member do
      post :start
    end
  end

  resources :badges, only: :index

  resources :test_passages, only: %i[show update] do
    resource :gist, only: :create
    member do
      get :result
    end
  end

  namespace :admin do
    resources :badges, except: :show
    resources :gists, only: :index
    resources :tests do
      patch :update_inline, on: :member
      resources :questions, shallow: true, except: :index do
        resources :answers, shallow: true, except: :index
      end
    end
  end

  root to: 'tests#index'
end
