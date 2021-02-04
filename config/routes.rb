Rails.application.routes.draw do

  resources :questions
  devise_for :users
  devise_scope :user do

    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  root 'questions#index'
end

