Rails.application.routes.draw do
  root to: 'pages#home'

  devise_for :students, path: 'students', controllers: { sessions: "students/sessions" }
  devise_for :admins, path: 'admins', controllers: { sessions: "admins/sessions" }

  resources :students, only: [:show]
  resources :admins, only: [:index, :show]

  get '/students/:id/promote', to: 'admin#promote_to_admin', as: :student_promote
end
