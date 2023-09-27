# frozen_string_literal: true

class CreateAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :accounts do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :email, null: false
      t.string :phone_number
      t.date :birthday
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
