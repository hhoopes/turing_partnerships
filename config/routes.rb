Rails.application.routes.draw do
  # root to: '#index'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  namespace 'admin' do
    resources :students
    resources :projects
  end

  resources :students, only: [:index, :edit, :update, :show]
  resources :projects, only: [:index, :show]
  resources :student_projects, only: [:create, :new, :delete]

  root to: 'students#index'

end
