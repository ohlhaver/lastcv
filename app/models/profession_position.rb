class ProfessionPosition < ActiveRecord::Base
  attr_accessible :position_id, :profession_id
  belongs_to :position
  belongs_to :profession
end
