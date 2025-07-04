class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.string :password_digest, null: false
      t.integer :role, default: 0, null: false
      t.string :name
      
      t.timestamps
    end
    
    add_index :users, :email, unique: true
  end
end 