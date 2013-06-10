class ChangeFieldsinJob < ActiveRecord::Migration
	def change
	  	remove_column :jobs, :postion_name
		add_column :jobs, :position_name, :string
  	end
end
