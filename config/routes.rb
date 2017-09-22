Rails.application.routes.draw do
  root to: 'pages#home'

  devise_for :students, path: 'students', controllers: { sessions: "students/sessions" }
  devise_for :admins, path: 'admins', controllers: { sessions: "admins/sessions" }

  resources :students, only: [:show]
  resources :admins, only: [:index, :show]

  get '/admins/promote/:id', to: 'admins#promote_to_admin', as: :promote
  get '/admins/demote/:id', to: 'admins#demote_to_student', as: :demote
end
