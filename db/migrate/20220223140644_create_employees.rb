class CreateEmployees < ActiveRecord::Migration[7.0]
  def change
    create_table :employees do |t|
      t.string :name, null: false
      t.string :address, null: false
      t.date :start_date
      t.string :contact, null: false
      t.boolean :role, null:false
      t.string :email, null: false
      t.string :password, null: false
      t.timestamps
    end
  end
end
