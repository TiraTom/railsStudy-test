class ChangeColumnsToUsers < ActiveRecord::Migration
  # 変更内容
  def up
    change_column :tweets, :content, :text, null: false, limit: 140
  end

  # 変更前の状態
  def down
    change_column :tweets, :content, :text, null: false
  end
end
