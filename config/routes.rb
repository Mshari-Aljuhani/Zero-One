Rails.application.routes.draw do
  resources :comments
  root 'questions#index'
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  resources :questions do
    resources :comments
    member do
      get 'like' => 'questions#like'
      get 'link' => 'questions#like_link'
    end
  end

end

