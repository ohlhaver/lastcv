class Approval < ActiveRecord::Base
  attr_accessible :invitation_id
  belongs_to :invitation
end
