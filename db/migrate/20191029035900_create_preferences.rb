class CreatePreferences < ActiveRecord::Migration[6.0]
  def change
    create_table :preferences do |t|
      t.string :term
      t.integer :times
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
