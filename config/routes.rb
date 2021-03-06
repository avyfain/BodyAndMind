BodyAndMind::Application.routes.draw do
  
  root to: 'pages#index'
  
  resources :reports
  
  match '/new_report', to: 'reports#new', via: 'get'
  match '/diary', to: 'reports#index', via: 'get'

  match '/views/reports/export.html.erb', to:'reports#export.html.erb',via:'get'
  match '/views/reports/export.html.erb', to:'reports#show',via:'post'
end
