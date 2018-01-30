class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

   # user roles
  enum role: [:standard, :premium, :admin]
  after_initialize :init

  # def set_default_role
  #  self.role ||= :standard
  # end

  def init
    self.role ||= :standard
  end

  # def self.upgrade(current_user)
  #   current_user.role = 'premium'
  # end

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :wikis, dependent: :destroy


end
