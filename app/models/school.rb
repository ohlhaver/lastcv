class School < ActiveRecord::Base
  attr_accessible :institution_id, :school_type_id, :subject_id, :value, :name
  belongs_to :institution
  belongs_to :school_type
  belongs_to :subject

end
