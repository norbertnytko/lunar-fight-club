class CreateFights < ActiveRecord::Migration
  def change
    create_table :fights do |t|

      t.timestamps null: false
    end
  end
end
