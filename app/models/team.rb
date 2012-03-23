class Team < ActiveRecord::Base
  has_many :members, :dependent => :destroy

  accepts_nested_attributes_for :members

  validates_associated :members

  validates :name, :presence   => true, 
                   :length     => { :minimum => 4, :maximum => 24 },
                   :uniqueness => true

  validates :members, :length => { :minimum => 2, 
                                   :maximum => 4, 
                                   :message => "should be at least 2" }
  
  validate :email_unique_among_members, :github_unique_among_members

  def email_unique_among_members
    unique_emails = members.collect{|member| member[:email]}.uniq
    if unique_emails.length != members.length
      errors.add(:members, "emails should be unique")
    end
  end
      
  def github_unique_among_members
    unique_githubs = members.collect{|member| member[:github]}.uniq
    if unique_githubs.length != members.length
      errors.add(:members, "github should be unique")
    end
  end
end
