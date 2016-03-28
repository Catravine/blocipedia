class Wiki < ActiveRecord::Base
  belongs_to :user
  has_many :collaborators, dependent: :destroy

  #scope :visible_to, -> (user) { !(user.standard?) ? all : where(public: true) }
  # scope :visible_to, -> (user) do
  #   if user.standard?
  #     where(public: true)
  #   else
  #     all
  #   end
  # end
  scope :visible_to, -> (user) { user.admin? ? all : where(public: true) }

end
