class TestScore < ActiveRecord::Base
  attr_accessible :profile_id, :score, :test_type
  validates_presence_of :score, :test_type
end
