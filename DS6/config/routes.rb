Rails.application.routes.draw do
  resources :notes
  resources :exams
  resources :enrollments
  resources :subjects
  resources :administrators
  resources :students
  resources :professors
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'sessions#login'

  get "/app/assets/apks/flutter.apk" => "descarga#descargar"
  get "/app/assets/images/*route", to:"notes#descargar"
  get "/login" => "sessions#login"
  post "/login" => "sessions#create"
  get "/logout" => "sessions#destroy"
  post "/logout" => "sessions#destroy"
  
end
