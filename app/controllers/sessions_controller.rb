# app/controllers/sessions_controller_spec.rb

require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

end
class SessionsController < ApplicationController
  
  describe "#create" do
    context "no active session, User and Authorization do not exist" do 
      context 'register with github' do        
        before(:each) do
          session[:user_id] = nil
          # Database has been cleaned, so shouldn't have to worry about User and Authorization
        end 
        describe 'When signing up for first time' do
          it "creates a User" do
            post :create, provider: :github
          end        
          it "creates an Authorization" do
            post :create, provider: :github
          end
          it "creates a session", :pending => true do 
          end
          it "creates a current_user", :pending => true do
          end
        end
        describe 'After successful registration', :pending => true do
          it "sets a flash message", :pending => true do
          end 
          it "creates an empty user profile" do
          end
          # Finally, we should test where it's going
          it "redirects to the edit profile page" do 
          end
        end
      end
    end
  end

  def start_test
  end

  def clear
  end
	
	def failure
  end

  def destroy
  end

  
end