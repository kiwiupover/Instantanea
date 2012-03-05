class AddSiteMapToWebpages < ActiveRecord::Migration
  def change
    add_column :websites, :site_map, :string
  end
end
