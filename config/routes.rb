Rails.application.routes.draw do
  resources :instructors, except: [ :destroy ] do
    get "modal_disable", on: :member
    put "disable", on: :member
  end
  resources :courses, except: [ :destroy ] do
    get "modal_disable", on: :member
    put "disable", on: :member
    get "turns_by_unit", on: :member
    get "calendar_format", on: :collection
    resources :course_people, only: [ :index, :new, :create ]
  end
  resources :units, except: [ :destroy ] do
    get "modal_disable", on: :member
    put "disable", on: :member
  end
  resources :questions, except: [ :destroy ] do
    get "modal_disable", on: :member
    put "disable", on: :member
  end
  resources :tests, except: [ :destroy ] do
    get "modal_disable", on: :member
    put "disable", on: :member
  end
  resources :course_types, except: [ :destroy ] do
    get "modal_disable", on: :member
    put "disable", on: :member
    get "get_yearly_and_general_number", on: :member
    resources :course_type_units
  end
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
    resources :managers, only: [ :index, :new, :create ]
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
