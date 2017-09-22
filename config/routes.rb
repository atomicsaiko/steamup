Rails.application.routes.draw do
  root to: 'pages#home'

  devise_for :students, path: 'students', controllers: { sessions: "students/sessions" }
  devise_for :admins, path: 'admins', controllers: { sessions: "admins/sessions" }

  resources :students, only: [:show]
  resources :admins, only: [:index, :show]

  get '/admins/promote/:id', to: 'admins#promote_to_admin', as: :promote
  get '/admins/demote/:id', to: 'admins#demote_to_student', as: :demote

  get '/admins/:id/studentpairs/create', to: 'admins#create_studentpairs', as: :admins_studentpairs_create
  get '/admins/:id/studentpairs/delete', to: 'admins#delete_studentpairs', as: :admins_studentpairs_delete
end
