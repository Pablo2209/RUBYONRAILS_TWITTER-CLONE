Rails.application.routes.draw do
  resources :tweets do 
    resources :likes
  end
  #Le indicamos al archivo de rutas que User va hacer el controlador de registro de usuarios
  devise_for :users
  get 'home/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #Ruta para generar los
  put '/tweet/:id/like', to: 'tweets#like', as: 'like'
  #root solicitado por devise
  root to: "tweets#index"
end
