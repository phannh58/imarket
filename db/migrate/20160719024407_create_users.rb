class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :full_name
      t.string :email
      t.string :password_digest
      t.string :avatar
      t.datetime :birth_day
      t.string :phone_number
      t.string :auth_token, unique: true, default: ""
      t.string :provider
      t.string :uid

      t.timestamps null: false
    end
  end
end
