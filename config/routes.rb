Rails.application.routes.draw do
  devise_for :students, path: 'students', controllers: { sessions: "students/sessions" }
  devise_for :admins, path: 'admins', controllers: { sessions: "admins/sessions" }
end
