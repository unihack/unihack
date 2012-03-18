class Team < ActiveRecord::Base
  has_many :members, :dependent => :destroy

  accepts_nested_attributes_for :members

  validates :name, :presence   => true, 
                   :length     => { :minimum => 4, :maximum => 24 },
                   :uniqueness => true
  validates :members, :length => { :minimum => 2, :maximum => 4, 
    :message => "should be at least 2 and maximum 4"}
            
 # def ensure_num_members_between_two_and_four
 #   if members.size < 2 
 #     errors.add(:name, "You need at least two members in a team")
 #   elsif members.size > 4
 #     errors.add(:name, "You can only be at most four members in a team")
 #   end
 # end

end
