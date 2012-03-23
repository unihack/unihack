class Member < ActiveRecord::Base
  belongs_to :team

  validates :name, :presence    => true
  validates :email, :presence   => true, 
                    :uniqueness => true, 
                    :format     => { :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i }
  validates :github, :presence  => true, :uniqueness => true
end
