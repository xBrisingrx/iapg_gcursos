Rails.application.routes.draw do
  resources :course_types
  resources :sectionals, except: [ :destroy ] do
    get "modal_disable", on: :member
    put "disable", on: :member
  end
  resources :rooms, except: [ :destroy ] do
    get "modal_disable", on: :member
    put "disable", on: :member
  end
  resources :headquarters, except: [ :destroy ] do
    get "modal_disable", on: :member
    put "disable", on: :member
  end
  resources :companies, except: [ :destroy ] do
    get "modal_disable", on: :member
    put "disable", on: :member
  end
  resources :iva_conditions, except: [ :destroy ] do
    get "modal_disable", on: :member
    put "disable", on: :member
  end
  resources :sectors, except: [ :destroy ] do
    get "modal_disable", on: :member
    put "disable", on: :member
  end
  resources :company_areas, except: [ :destroy ] do
    get "modal_disable", on: :member
    put "disable", on: :member
  end
  resources :company_categories, except: [ :destroy ] do
    get "modal_disable", on: :member
    put "disable", on: :member
  end
  resources :people, except: [ :destroy ] do
    get "modal_disable", on: :member
    put "disable", on: :member
  end
  get "main/index"
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  root "people#index"
end
