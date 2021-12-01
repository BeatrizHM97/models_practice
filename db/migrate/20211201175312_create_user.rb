class CreateUser < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :lastname
      t.date :birth_date
      t.string :email_address, uniqueness: true
      t.string :password_digest
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
