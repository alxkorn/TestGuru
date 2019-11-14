# frozen_string_literal: true

Rails.application.routes.draw do
  root 'main_page#show'

  devise_for :users,
             path: :gurus,
             path_names: { sign_in: :login, sign_out: :logout },
             controllers: { sessions: 'users/sessions' }

  resources :tests, only: :index do
    member do
      post :start
    end
  end

  resources :test_passages, only: %i[show update] do
    member do
      get :result
      post :gist
    end
  end

  resources :badges, only: %i[index] do
  end
  resources :user_badges, only: %i[index]

  namespace :admin do
    resources :badges do
      get :choose_type, on: :collection
    end

    # resources :user_badges, only: %i[index]
    resources :gists, only: %i[index create]
    resources :tests do
      patch :update_inline, on: :member
      resources :questions, shallow: true, except: :index do
        resources :answers, shallow: true, except: :index
      end
    end
  end
end
