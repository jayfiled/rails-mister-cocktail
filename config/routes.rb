Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'cocktails#index'

  delete 'doses/:id', to: 'doses#destroy', as: :doses

  resources :cocktails, only: %i[show new create destroy] do
    resources :doses, only: %i[new create]
  end
end
