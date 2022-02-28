Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: redirect('/budgets')

  resources :expenses
  resources :budgets do
    collection do
      get :next, to: 'budgets#next'
      get :previous, to: 'budgets#previous'
    end
  end
end
