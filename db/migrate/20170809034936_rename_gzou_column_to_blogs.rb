class RenameGzouColumnToBlogs < ActiveRecord::Migration
  def change
    rename_column :blogs, :gzou, :pic
  end
end
