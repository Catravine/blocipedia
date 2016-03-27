class Wiki < ActiveRecord::Base
  belongs_to :user

  scope :visible_to, -> (user) { !(user.standard?) ? all : where(public: true) }

end
