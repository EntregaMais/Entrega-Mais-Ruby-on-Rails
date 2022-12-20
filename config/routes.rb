Rails.application.routes.draw do
  resources :despachantes do
    get 'nmdespachante/:nmdespachante', to: 'despachantes#findByNmdespachante', on: :collection
    get 'idtransportadora/:idtransportadora', to: 'despachantes#findByIdtransportadora', on: :collection
  end
  resources :veiculos do
    get 'placa/:placa', to: 'veiculos#findByPlaca', on: :collection
    get 'idrota/:idrota', to: 'veiculos#findByIdrota', on: :collection
    get 'idtransportadora/:idtransportadora', to: 'veiculos#findByIdtransportadora', on: :collection
  end
  resources :polis  do
    get 'idapi/:idapi', to: 'cidades#findByIdapi', on: :collection
    get 'nmcidade/:nmcidade', to: 'cidades#findByNmcidade', on: :collection
    get 'idtrajeto/:idtrajeto', to: 'cidades#findByIdtrajeto', on: :collection
  end
  resources :trajetos do
    get 'nmtrajeto/:nmtrajeto', to: 'trajetos#findByNmtrajeto', on: :collection
    get 'idtransportadora/:idtransportadora', to: 'trajetos#findByIdtransportadora', on: :collection
  end
  resources :cidades
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
