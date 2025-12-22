class MergeArticlesToPosts < ActiveRecord::Migration[8.1]
  def up
    # Copy articles -> posts (map body -> content)
    Article.find_each do |article|
      Post.create!(
        title: article.title,
        content: article.body,
        published: article.published,
        user: User.first # or match by author if exists
      )
    end

    # Drop articles table
    drop_table :articles
  end

  def down
    # Reversible: recreate articles from posts backup if needed
    create_table :articles do |t|
      t.string :title
      t.text :body
      t.boolean :published, default: false
      t.timestamps
    end
  end
end
