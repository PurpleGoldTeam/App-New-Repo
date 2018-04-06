class CreateSsousers < ActiveRecord::Migration[5.1]
  def change
    create_table :ssousers do |t|
      t.string :name
      t.string :provider
      t.string :uid

      t.timestamps
    end
  end
end
