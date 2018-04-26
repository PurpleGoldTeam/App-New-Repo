class AddProfileToSsousers < ActiveRecord::Migration[5.1]
  def change
    add_reference :ssousers, :profile, foreign_key: true
  end
end
