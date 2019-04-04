Rails.application.routes.draw do
  get 'fights/select(/:id)', to: 'fights#select', as: 'select_fight'
  get 'fights/go/:id1/vs/:id2', to: 'fights#go', as: 'go_fight'

  get 'welcome/index'

  resources :fighters

  root 'welcome#index'
end
