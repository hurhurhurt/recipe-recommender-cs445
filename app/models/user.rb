# app/models/user.rb

class User < ActiveRecord::Base
  has_many :authorizations, :dependent => :destroy
  validates :name, :email, :presence => true
  
  def self.create_with_omniauth info
    create!(name: info['name'], email: info['email'])
  end
  validate :staff_or_student
  
  def staff_or_student
    errors.add(:email, "must be for Binghamton University") if
      email.split('@')[1] != "binghamton.edu"
  end
end
