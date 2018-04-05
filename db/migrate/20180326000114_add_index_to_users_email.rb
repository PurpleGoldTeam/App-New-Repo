class AddIndexToUsersEmail < ActiveRecord::Migration[5.1]
  def change
    add_index :users, :email, :bio ,:race ,:sex ,:religion ,:education ,
    :ocupation ,:income ,:smoker ,:height ,:weight
      ,:age
      ,:address
      ,:city
      ,:state
      ,:zipunique: true
  end
end
