class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :merchant_page
  belongs_to :city
  has_many :adverts
  has_and_belongs_to_many :cities


  def roles
    user_roles.split(" ") || []
  end

  def is?(role)
    roles.include?(role.to_s)
  end
end
