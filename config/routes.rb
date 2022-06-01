Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: redirect('/home')

  get '/home', to: 'users#index'

  #this is there for redirecting after sign up

  resources :accounts
  resources :transfers
  resources :expenses
  resources :budgets do
    collection do
      get :next, to: 'budgets#next'
      get :previous, to: 'budgets#previous'
    end
  end
end
