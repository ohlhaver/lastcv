class ProfileLanguage < ActiveRecord::Base
  attr_accessible :language_id, :profile_id
  belongs_to :profile
  belongs_to :language 
end
