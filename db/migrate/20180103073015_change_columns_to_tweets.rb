class ChangeColumnsToTweets < ActiveRecord::Migration
  # 変更内容
  def up
    change_column :users, :image, :string, null: false
    change_column :users, :profile, :text, null: false
  end

  # 変更前の状態
  def down
    change_column :users, :image
    change_column :users, :profile, :text
  end
end
