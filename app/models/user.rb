class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  

  #Asociacion del user con los likes  1 a N, por eso tweets es plural
  has_many :likes

  #Asociacion del usuario con los tweets   1 a N, por eso tweets es plural
  has_many :tweets
end
