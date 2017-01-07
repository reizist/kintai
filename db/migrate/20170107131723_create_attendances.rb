class CreateAttendances < ActiveRecord::Migration[5.0]
  def change
    create_table :attendances do |t|
      t.references :user, null: false
      t.date :date, null: false
      t.integer :status, null: false, default: 0
      t.float :duration, null: false, default: 0

      t.timestamps
    end
  end
end
