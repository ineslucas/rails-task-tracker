class User < ApplicationRecord
  # This application wouldn't run without adding this line. Why?
  attr_accessor :first_name
  attr_accessor :last_name

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
