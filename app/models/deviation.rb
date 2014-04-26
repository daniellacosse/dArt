class Deviation < ActiveRecord::Base
  has_attached_file :media

  include PgSearch
  multisearchable against: [:title]

  validates :user_id,
            :title,
            presence: true

  validates :is_mature,
            :is_commentable,
            :is_shareable,
            :is_likeable,
            :is_DRM,
            :is_CC,
            :can_remix,
            inclusion: { in: [true, false], message: "something's up" }

  has_many :views, as: :viewable, dependent: :destroy
  has_many :likes, as: :likeable, dependent: :destroy
  has_many :tags, as: :taggable, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy
  belongs_to :user

  has_many :followers,
           through: :likes,
           source: :liker
end