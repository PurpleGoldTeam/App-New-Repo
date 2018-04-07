class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
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
      t.string :drinker
      t.string :height
      t.string :weight
      t.string :age
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.timestamps
    end
    
    add_index :users, :email, unique: true
  end
end
