Rails.application.routes.draw do
  resources :despachantes
  resources :veiculos
  resources :cidades
  resources :trajetos
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
