class CreateAttendences < ActiveRecord::Migration[7.0]
  def change
    create_table :attendences do |t|
      t.belongs_to :employee
      t.date :date, null: false
      t.time :check_in 
      t.time :check_out
      t.time :duration
      t.timestamps
    end
  end
end
