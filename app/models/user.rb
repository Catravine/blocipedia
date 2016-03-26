class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable

  has_many :wikis

  enum role: [:standard, :premium, :admin]

  def name
    username = self.email.split(/@/).first.humanize.titleize
  end

  def downgrade!
    standard!
    wikis.each { |w| w.update(public: true) }
    wikis.none? { |w| !w.public? }
  end

end
