class Wiki < ApplicationRecord
  belongs_to :user
  has_many :collaborates, dependent: :destroy
  has_many :users, through: :collaborates

  validates :title, length: { minimum: 5 }, presence: true
  validates :body, length: { minimum: 10 }, presence: true
  validates :user, presence: true

  scope :visible_to, -> (user) { user.role == 'admin' || user.role == 'premium' ? all : where(private: false) }

end
