class Post < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :content, presence: true, length: { in: 1..500 }

  def created_time_formatted
    created_at.strftime("%b %-d, %Y - %l:%M %P")
  end
end
