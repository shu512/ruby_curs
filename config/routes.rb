Rails.application.routes.draw do
  get 'examinations/:id/questions', to: 'examinations#questions'
  resources :groups
  resources :students

  resources :disciplines do
    resources :questions
  end

  resources :examinations
  resources :lists

  root 'groups#index'
end
