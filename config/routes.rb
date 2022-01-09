Rails.application.routes.draw do
  resources :tests, only: [] do
    resources :questions, only: %i[index show create new destroy], shallow: true
  end
end
