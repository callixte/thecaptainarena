Rails.application.routes.draw do
  get 'fights/select(/:id)', to: 'fights#select', as: 'select_fight'
  get 'fights/weapons/:id1/vs/:id2', to: 'fights#weapons', as: 'select_weapons'
  post 'fights/go/:id1/vs/:id2', to: 'fights#go', as: 'go_fight'
  get 'fights', to: 'fights#index'

  get 'welcome/index'

  get 'fighters/avatar', to: 'fighters#avatar', as: 'fighter_avatar'
  resources :fighters
  resources :weapons

  root 'welcome#index'
end
