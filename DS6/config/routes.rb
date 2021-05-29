Rails.application.routes.draw do
  resources :notes
  resources :exams
  resources :enrollments
  resources :subjects
  resources :administrators
  resources :students
  resources :professors
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'professors#index'

  get "/app/assets/apks/flutter.apk" => "descarga#descargar"
  get "/app/assets/images/*route", to:"notes#descargar"

  get "/api/v1/notes/*id/descargar" => "notes#descargar"
  
  namespace :api, defaults: { format: 'json' }  do
    namespace :v1 do
      resources :notes
      resources :exams
      resources :enrollments
      resources :subjects
      resources :administrators
      resources :students
      resources :professors
    end
  end
end
