class Applicant < ActiveRecord::Base
  attr_accessible :address, :email, :first_name, :last_name, :linked_in_address, :phone, :skype_id
  belongs_to :profile
  
end
