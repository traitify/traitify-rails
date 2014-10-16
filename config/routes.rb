Rails.application.routes.draw do
  resources :assessments

  root 'assessments#index'
end
