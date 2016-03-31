class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable

  has_many :wikis
  has_many :collaborators, dependent: :destroy
  has_many :wiki_collaborations, through: :collaborators, source: :wiki

  enum role: [:standard, :premium, :admin]

  def name
    username = self.email.split(/@/).first.humanize.titleize
  end

  def downgrade!
    standard!
    Collaborator.where(user_id: id).each { |collab| collab.destroy! }
    wikis.each { |w| w.update(public: true) }
    wikis.none? { |w| !w.public? }
  end

end
