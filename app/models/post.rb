class Post < ApplicationRecord
  belongs_to :user
  validates :title, :content, presence: true # Optional
  enum published: { draft: 0, published: 1 }
end
