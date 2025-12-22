class ChangePublishedToIntegerOnPosts < ActiveRecord::Migration[8.1]
  def up
    change_column_default :posts, :published, from: false, to: nil
    change_column :posts, :published, :integer, using: 'published::integer'

    change_column_default :posts, :published, from: nil, to: 0
    change_column_null :posts, :published, false
  end

  def down
    change_column_default :posts, :published, from: 0, to: nil

    change_column :posts, :published, :boolean, using: 'published::boolean', default: false, null: false

    change_column_default :posts, :published, from: nil, to: false
    change_column_null :posts, :published, false
  end
end
