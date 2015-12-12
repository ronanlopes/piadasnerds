Rails.application.routes.draw do
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

end
