class AddWinnerLoserToFights < ActiveRecord::Migration
  def change
    add_column :fights, :winner_id, :integer, index: true, foreign_key: true
    add_column :fights, :losser_id, :integer, index: true, foreign_key: true
  end
end
