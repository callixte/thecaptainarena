Rails.application.routes.draw do
  get 'welcome/index'

  resources :fighters
  
  root 'welcome#index'
end
