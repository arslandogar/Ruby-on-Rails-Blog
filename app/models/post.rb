class Post < ApplicationRecord
    validates :title, presence: true
    validates :description, presence: true
    mount_uploader :image, PostImageUploader
    belongs_to :user
    has_many :comments
    include PgSearch::Model
    pg_search_scope :search_by_title, against: :title
end