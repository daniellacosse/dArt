class Journal < ActiveRecord::Base
  validates :user_id, :title, presence: true

  belongs_to :user
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :tags, as: :taggable, dependent: :destroy
end
