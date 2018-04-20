class RemoveColumnsFromUser < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :bio
    remove_column :users, :race
    remove_column :users, :sex
    remove_column :users, :religion
    remove_column :users, :education
    remove_column :users, :ocupation
    remove_column :users, :income
    remove_column :users, :smoker
    remove_column :users, :height
    remove_column :users, :weight
    remove_column :users, :age
    remove_column :users, :address
    remove_column :users, :city
    remove_column :users, :state
    remove_column :users, :zip
    
    

  end
end
