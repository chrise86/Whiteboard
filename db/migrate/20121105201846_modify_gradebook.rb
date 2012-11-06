class ModifyGradebook < ActiveRecord::Migration
  def up
    remove_column :gradebooks, :grade
    remove_column :gradebooks, :attachment
  end

  def down
    add_column :gradebooks, :grade, :decimal, :scale => 5, :precision => 2
    add_column :gradebooks, :attachment, :string
  end
end
