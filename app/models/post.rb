class Post < ApplicationRecord
  STATUSES = ["draft", "published"]

  #belongs_to :user

  validates :title, presence: true, uniqueness: true
  validates :body, presence: true
  validates :status, presence: true, inclusion: { in: STATUSES }
  before_create :add_title_to_body

  scope :published, -> { where(status: "published")}
  scope :draft, -> {where(status: "draft")}

  def add_title_to_body
    self.body = "#{title} - #{body}"
  end
end
