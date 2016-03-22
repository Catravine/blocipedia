class RenameWikiPublicColumn < ActiveRecord::Migration
  def change
    rename_column :wikis, :private, :public
    change_column :wikis, :public, :boolean, default: true
  end
end
