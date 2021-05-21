Rails.application.routes.draw do
  resources :nota
  resources :examenes
  resources :matriculas
  resources :asignaturas
  resources :administradors
  resources :alumnos
  resources :profesores
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
