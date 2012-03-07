class CreatePageInTimes < ActiveRecord::Migration
  def change
    create_table :page_instances do |t|
      t.string :screen_shot
      t.integer :page_id
      t.text :html
      t.string :md5

      t.timestamps
    end
  end
end
