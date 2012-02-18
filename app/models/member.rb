class Member < ActiveRecord::Base
  validates :name,   :presence => true
  validates :email,  :presence => true, :uniqueness => true
  validates :github, :presence => true

  belongs_to :team
end
