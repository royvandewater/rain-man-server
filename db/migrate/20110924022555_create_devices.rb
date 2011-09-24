class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.string :udid
      t.integer :uses, :default => 3
      t.boolean :premium

      t.timestamps
    end
  end
end
