class Team < ActiveRecord::Base
  validates :name, :presence => true, 
                   :length => { :minimum => 5, :maximum => 50 }, 
                   :uniqueness => true
  has_many :members, :dependent => :destroy
end
