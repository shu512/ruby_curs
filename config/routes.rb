Rails.application.routes.draw do
  #get 'groups/index'
  #get 'students/index'
  #get 'disciplines/index'
  #get 'examinations/index'
  resources :groups
  resources :students

  resources :disciplines do
    resources :questions
  end

  resources :examinations

  root 'groups#index'
end
