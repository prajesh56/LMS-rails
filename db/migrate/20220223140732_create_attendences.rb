class CreateAttendences < ActiveRecord::Migration[7.0]
  def change
    create_table :attendences do |t|
      t.belongs_to :user
      t.date :date, null: false
   
      t.time :duration
      t.timestamps
    end
  end
end
