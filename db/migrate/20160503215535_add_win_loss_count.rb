class AddWinLossCount < ActiveRecord::Migration
  def change
    add_column :users, :win_total, :integer, default: 0
    add_column :users, :loss_total, :integer, default: 0
  end
end
