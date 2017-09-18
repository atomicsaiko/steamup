Rails.application.routes.draw do
  root to: 'pages#home'

  devise_for :students, path: 'students', controllers: { sessions: "students/sessions" }
  devise_for :admins, path: 'admins', skip: [:registrations], controllers: { sessions: "admins/sessions" }
end
