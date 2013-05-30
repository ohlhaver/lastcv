class AddHelpToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :help, :boolean
  end
end
