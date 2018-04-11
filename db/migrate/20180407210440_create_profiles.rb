class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.references :owner
      t.string :name
      t.string :email
      t.string :bio
      t.string :race
      t.string :sex
      t.string :religion
      t.string :education
      t.string :ocupation
      t.string :income
      t.string :smoker
      t.string :height
      t.string :weight
      t.string :age
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
    end
  end
end
