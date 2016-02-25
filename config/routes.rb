Rails.application.routes.draw do
  namespace 'admin' do
    resources :students
    resources :projects
  end

  resources :students, only: [:index, :edit, :update, :show]
  resources :projects, only: [:index, :show]
  resources :student_projects, only: [:create, :new, :delete]
end
