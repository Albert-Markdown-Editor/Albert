# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # API ROUTES
  # ----------

  # UI ROUTES
  # ---------
  resources :projects, only: %i[index show] do
    resources :documents, only: %i[index show]
  end

  namespace :editor do
    resources :documents, only: [:show, :new]
  end

  # LookBook Engine
  # More information: https://github.com/allmarkedup/lookbook#2-mount-the-lookbook-engine
  Rails.application.routes.draw do
    if Rails.env.development?
      mount Lookbook::Engine, at: "/internal/docs/lookbook"
    end
  end
end
