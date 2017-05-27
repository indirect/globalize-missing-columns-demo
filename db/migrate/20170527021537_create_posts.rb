class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body

      t.timestamps
    end

    reversible do |dir|
      dir.up do
        Post.create_translation_table! title: :string
      end

      dir.down do
        Post.drop_translation_table!
      end
    end
  end
end
