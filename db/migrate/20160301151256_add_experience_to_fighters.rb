class AddExperienceToFighters < ActiveRecord::Migration
  def change
    add_column :fighters, :experience_points, :integer, default: 0
  end
end
