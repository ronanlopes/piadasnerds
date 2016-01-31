require 'sidekiq/web'

Rails.application.routes.draw do
  resources :fontes
  resources :calendarios
  resources :grade_horarios
  resources :seguidores
  resources :posts
  devise_for :users
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".


  devise_scope :user do
    authenticated :user do
      root :to => 'application#index', as: :authenticated_root
    end
    unauthenticated :user do
      root :to => 'devise/sessions#new', as: :unauthenticated_root
    end
  end


  #páginas de erro
  get '/404', to: 'pages#not_found', via: :all
  get '/500', to: 'pages#internal_server_error', via: :all


  mount Sidekiq::Web, at: '/sidekiq'

  resources :user_management, except: :show
  get 'minha_conta' => 'user_management#minha_conta', as: :minha_conta
  get 'user_management/alterar_senha' => 'user_management#alterar_senha', as: :alterar_senha
  patch "user_management/:id/minha_conta/update" => "user_management#update_self", as: :update_self
  get 'mapa_de_seguidores' => "application#mapa_de_seguidores", as: :mapa_de_seguidores
  get 'trendings' => "application#trendings", as: :trendings
  get 'horarios' => "application#horarios", as: :horarios
  post '/salvar_evento' => "calendarios#salvar_evento", as: :salvar_evento
  post '/remover_evento' => "calendarios#remover_evento", as: :remover_evento
  get 'notas' => "application#notas", as: :notas
  get 'podcast' => "application#podcast", as: :podcast
  get 'wiki' => "application#wiki", as: :wiki



end
