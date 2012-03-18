class Team < ActiveRecord::Base
  has_many :members, :dependent => :destroy

  accepts_nested_attributes_for :members

  validates :name, :presence   => true, 
                   :length     => { :minimum => 4, :maximum => 24 },
                   :uniqueness => true
  validates :members, :length => { 
    :minimum => 2, 
    :maximum => 4, 
    :message => "should be at least 2"
  }
end
