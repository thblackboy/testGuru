Rails.application.routes.draw do
  # get 'questions/index'
  # get 'questions/show'
  # get 'tests/index'
  # get 'tests/show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :tests do
    resources :questions
  end
end
