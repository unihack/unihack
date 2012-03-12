class Team < ActiveRecord::Base
  has_many :members, :dependent => :destroy

  validates :name, :presence   => true, 
                   :length     => { :minimum => 4, :maximum => 24 },
                   :uniqueness => true
end
