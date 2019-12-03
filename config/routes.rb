Rails.application.routes.draw do
  #get 'groups/index'
  get 'students/index'
  resources :groups

  resources :students

  root 'groups#index'
end
