class AddGzouToBlogs < ActiveRecord::Migration
  def change
    add_column :blogs, :gzou, :string
  end
end
