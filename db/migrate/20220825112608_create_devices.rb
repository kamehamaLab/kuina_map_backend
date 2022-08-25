class CreateDevices < ActiveRecord::Migration[6.1]
  def change
    create_table :devices, id: :uuid do |t|
      t.string :name
      t.float :remaining_bat

      t.timestamps
    end
  end
end
