class Article < ApplicationRecord
    # Validations to ensure no bad data enters your database
    validates :title, presence: true, length: { minimum: 5 } 
    validates :body, presence: true

    scope :published, -> { where(published: true)}
end
