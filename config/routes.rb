BodyAndMind::Application.routes.draw do
  
  root to: 'pages#index'
  
  resources :reports
  
  match '/new_report', to: 'reports#new', via: 'get'
  
end
