class CreateDetectionRepts < ActiveRecord::Migration[6.1]
  def change
    create_table :detection_repts, id: :uuid do |t|
      t.decimal :x_coord
      t.decimal :y_coord
      t.string :device_id

      t.timestamps
    end
  end
end
