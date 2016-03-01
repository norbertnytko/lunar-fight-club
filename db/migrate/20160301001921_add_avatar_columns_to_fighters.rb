class AddAvatarColumnsToFighters < ActiveRecord::Migration
  def change
    add_attachment :fighters, :avatar
  end
end
