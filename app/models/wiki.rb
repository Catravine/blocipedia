class Wiki < ActiveRecord::Base

  extend FriendlyId
  friendly_id :title, use: :slugged

  belongs_to :user
  has_many :collaborators, dependent: :destroy
  has_many :collaborating_users, through: :collaborators, source: :user

end
