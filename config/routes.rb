Rails.application.routes.draw do
  get 'groups/index'

  resources :groups do
    resources :students
  end

  root 'groups#index'
end
