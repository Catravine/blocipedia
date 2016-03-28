class Wiki < ActiveRecord::Base
  belongs_to :user
  has_many :collaborators, dependent: :destroy

  scope :visible_to, -> (user) { !(user.standard?) ? all : where(public: true) }

end
