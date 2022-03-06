class CreateLeaverecords < ActiveRecord::Migration[7.0]
  def change
    create_table :leaverecords do |t|
      t.belongs_to :user
      t.date :date_from, null: false
      t.date :date_to, null: false
      t.text :description, null: false
      t.string :status
      t.string :approval_by
      t.timestamps
    end
  end
end
