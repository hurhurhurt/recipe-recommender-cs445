require 'rails_helper'
class SessionsController < ApplicationController
  def start_test
  end

  def clear
  end

#  def debug
 # end
  
  def create 
    begin
    user = User.create_with_omniauth(auth_hash['info'])
    auth = Authorization.create_with_omniauth(auth_hash, @user)
    session[:user_id] = auth.user.id
    self.current_user= auth.user
    @profile = @user.create_profile
    message = "Welcome #{user.name}! You have signed up via #{auth.provider}."
    flash[:notice] = message
    flash[:warning] = "#{exception.class}: #{exception.message}" 
    redirect_to edit_user_profile_path(@user,@profile) 
    rescue ActiveRecord::RecordInvalid,  Exception => exception
      redirect_to welcome_landing_path and return
    end
  end
  
  def new
  end

  def auth_hash
    #ensures that it's only retrieved once per cycle
    @auth_hash ||= request.env['omniauth.auth']
  end
end