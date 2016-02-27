Rails.application.routes.draw do

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  namespace 'admin' do
    resources :students
    resources :projects
  end

  resources :students, only: [:index, :edit, :update, :show] do
     resources :my_projects, only: [:create, :new, :delete]
  end
  resources :projects, only: [:index, :show]

  root to: 'students#index'

end
