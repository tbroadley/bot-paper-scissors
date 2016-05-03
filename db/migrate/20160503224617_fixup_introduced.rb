class FixupIntroduced < ActiveRecord::Migration
  def change
    change_column :users, :introduced, :boolean, default: false
  end
end
