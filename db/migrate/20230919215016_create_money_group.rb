class CreateMoneyGroup < ActiveRecord::Migration[7.0]
  def change
    create_table :money_groups do |t|
      t.references :group, null: false, foreign_key: true
      t.references :money_track, null: false, foreign_key: true

      t.timestamps
    end
  end
end
