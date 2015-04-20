class SessionsController < ApplicationController
   def new
   end

   def create
     user = User.authenticate(params[:email], params[:password])
     if user
       session[:user_id] = user.id
       if user.perfil == "ROLE_ADMIN"
	  redirect_to admin_panel_path, :notice => "Logged in!"
       elsif user.perfil == "ROLE_MEDICO"
	  redirect_to user_cargo_works_path, :notice => "Logged in!"
       end
     else
       flash.now.alert = "Invalid email or password"
       render "new"
     end
   end

   def destroy
     session[:user_id] = nil
     redirect_to root_url, :notice => "Logged out!"
   end
end
