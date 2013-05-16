class ChangeFieldsinTestScore < ActiveRecord::Migration
  	def change
	  	remove_column :test_scores, :type
		add_column :test_scores, :test_type, :integer
	
	end
end
