class CreateBlogs < ActiveRecord::Migration[5.1]
  def change
    create_table :blogs do |t|
      t.text "tag"
      t.text "title"
      t.text "content"
      t.timestamps
    end
  end
end
