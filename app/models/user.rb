class User < ApplicationRecord
  has_many :wikis, dependent: :destroy
  has_many :collaborates, dependent: :destroy
  # has_many :wiki_collaborations, through: :collaborates, source: :wiki

  enum role: [:standard, :premium, :admin]
  after_initialize :init

  def init
    self.role ||= :standard
  end

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :wikis, dependent: :destroy


  def collaborates_on(wiki)
    collaborators = Collaborate.where(user_id: @user.id, wiki_id: @wiki.id)
    wiki_collaborations = Wiki.where(id: collaborators.pluck(:wiki_id))
  end
end
