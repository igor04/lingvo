class English < ActiveRecord::Migration
  def up
    create_table :english do |t|
      t.column :eng, :string, :null => false
      t.column :ru, :string, :null => false
      t.column :transcr, :string
    end
  end

  def down
    drop_table :english
  end
end
