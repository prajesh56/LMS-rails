class CreateLeaves < ActiveRecord::Migration[7.0]
  def change
    create_table :leaves do |t|
      t.belongs_to :employee
      t.date :date_from, null: false
      t.date :date_to, null: false
      t.text :description, null: false
      t.boolean :status
      t.string :approval_by
      t.timestamps
    end
  end
end
