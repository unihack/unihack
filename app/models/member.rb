class Member < ActiveRecord::Base
  belongs_to :team

  validates :name,   :presence => true
  validates :email,  :presence => true, :uniqueness => true
  validates :github, :presence => true, :uniqueness => true
end
