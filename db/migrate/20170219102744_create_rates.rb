class CreateRates < ActiveRecord::Migration[5.0]
  def change
    create_table :rates do |t|
      t.float :value, null: false

      t.timestamps
    end
  end
end
