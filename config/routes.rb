Rails.application.routes.draw do
  #get 'groups/index'
  get 'students/index'
  get 'disciplines/index'
  resources :groups
  resources :students

  resources :disciplines do
    resources :questions
  end

  root 'groups#index'
end
