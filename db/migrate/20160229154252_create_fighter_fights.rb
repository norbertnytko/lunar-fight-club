class CreateFighterFights < ActiveRecord::Migration
  def change
    create_table :fighter_fights do |t|
      t.references :fight, index: true, foreign_key: true
      t.references :fighter, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
