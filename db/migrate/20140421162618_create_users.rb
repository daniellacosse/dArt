class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username,        null: false
      t.string :email,           null: false
      t.string :password_digest
      t.string :token,           null: false
      t.string :verification_key
      t.boolean :is_verified, default: false

      t.date :date_of_birth,     null: false
      t.string :first_name
      t.string :last_name

      t.string :provider
      t.string :uid

      t.string :country
      t.string :gender

      t.text :biography
      t.attachment :avatar

      t.timestamps
    end

    add_index :users, :username, unique: true
    add_index :users, :email,    unique: true
    add_index :users, :token,    unique: true
  end
end
