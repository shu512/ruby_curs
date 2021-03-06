Rails.application.routes.draw do
  devise_for :users
  resources :examlists
  get 'examinations/:id/questions', to: 'examinations#questions'
  resources :groups
  resources :students

  resources :disciplines do
    resources :questions
  end

  resources :examinations

  root 'groups#index'
end
