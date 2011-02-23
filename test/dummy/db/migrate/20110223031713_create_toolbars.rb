class CreateToolbars < ActiveRecord::Migration
  def self.up
    create_table :toolbars do |t|
      t.string :name
      t.timestamps
    end
  end

  def self.down
    drop_table :toolbars
  end
end
