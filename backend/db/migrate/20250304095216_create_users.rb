class CreateUsers < ActiveRecord::Migration[7.2]
  def change
    create_table :users do |t|
      t.uuid :user_uuid, default: 'gen_random_uuid()', null: false
      t.string :username, null: false
      t.string :email, null: false
      t.string :password_digest, null: false
      t.boolean :is_admin,default:false,null:false
      t.timestamps
    end
    add_index :users, :user_uuid, unique: true
    add_index :users, :email, unique: true
  end
end