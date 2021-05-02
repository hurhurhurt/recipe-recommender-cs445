require 'rails_helper'
class SessionsController < ApplicationController
  def start_test
  end

  def clear
  end

#  def debug
 # end
  
  def create 
     user = User.create!("name" => auth_hash[:info][:name], "email" => auth_hash[:info][:email])
  end
  
  def new
  end

  def auth_hash
    #ensures that it's only retrieved once per cycle
    @auth_hash ||= request.env['omniauth.auth']
  end
end