class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags

  validates :title, :body, presence: true
  validate :must_have_at_least_one_tag

  after_create_commit :schedule_deletion

  private

  def must_have_at_least_one_tag
    errors.add(:tags, "must have at least one tag") if tags.empty?
  end

  def schedule_deletion
    PostDeletionJob.perform_in(24.hours, id)
  end
end
