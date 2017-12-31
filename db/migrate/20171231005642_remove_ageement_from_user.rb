class RemoveAgeementFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :agreement, :boolean, null: false, default: false
  end
end
