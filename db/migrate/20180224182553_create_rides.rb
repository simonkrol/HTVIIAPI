class CreateRides < ActiveRecord::Migration[5.1]
  def change
    create_table :rides do |t|
      t.string :startL
      t.string :endL
      t.time :startT
      t.time :endT
      t.string :type
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
