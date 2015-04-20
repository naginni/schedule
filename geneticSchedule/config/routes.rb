Rails.application.routes.draw do

  get 'sessions/new'

   # rutas para el admin
   get "admin_panel" => 'admins#panelAdmin', :as => "admin_panel" 
   get 'admin_panel/users/:user/cargos/:cargo' => 'admins#usersAddCargos', :as => "add_users_cargos"
   get 'admin_panel/destroy/:id/user/:user' => 'admins#destroyUserCargo', :as => "destroy_user_cargo"
    #--------- medicos ----------
   #get "medico_panel" => 'user_cargo_works#index', :as => "medico_panel" 
   #get "medico_edit/:id/edit" => 'user_cargo_works#edit', :as => "medico_edit" 
   resources :user_cargo_works 

   #--------- consultorios  ----------
   resources :consultorios 
   resources :cargos 
   # rutas para los users
   get "log_out" => "sessions#destroy", :as => "log_out"
   get "log_in" => "sessions#new", :as => "log_in"
   get "sign_up" => "users#new", :as => "sign_up"
   root :to => "sessions#new"
   resources :users
   resources :sessions
end
