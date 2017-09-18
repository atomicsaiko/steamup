Rails.application.routes.draw do
  devise_for :students, path: 'students', controllers: { sessions: "students/sessions" }
end
