class AddValueToProfileLanguage < ActiveRecord::Migration
  def change
    add_column :profile_languages, :value, :integer
  end
end
