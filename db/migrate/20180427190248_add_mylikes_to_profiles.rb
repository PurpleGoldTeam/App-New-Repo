class AddMylikesToProfiles < ActiveRecord::Migration[5.1]
  def change
    add_column :profiles, :mylikes, :string
  end
end
