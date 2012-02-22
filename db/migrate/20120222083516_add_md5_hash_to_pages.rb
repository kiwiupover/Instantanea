class AddMd5HashToPages < ActiveRecord::Migration
  def change
    add_column :pages, :md5, :string
  end
end
