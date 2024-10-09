Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root "tests#index"

  devise_for :users, path: :gurus, path_names: { sign_in: :login, sign_out: :logout }

  resources :tests, only: :index do
    member do
      post :start
    end
  end

  resources :test_passages, only: %i[update show] do
    member do
      get :result
    end
  end

  namespace :admin do
    resources :tests do
      patch :update_inline, on: :member
      patch :update_status, on: :member

      resources :questions, shallow: true, except: :index do
        resources :answers, shallow: true, except: :index
      end
    end

    resources :badges

    resources :gists, only: :index
  end

  resources :feedbacks, only: [:new, :create]

  resources :badges, only: :index

  resources :gists, only: :create
end
