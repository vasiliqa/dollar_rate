class CreateForcedRates < ActiveRecord::Migration[5.0]
  def change
    create_table :forced_rates do |t|
      t.float :value, null: false
      t.datetime :expiry_time, null: false

      t.timestamps
    end
  end
end
