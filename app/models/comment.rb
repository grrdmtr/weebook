class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :content, presence: true, length: { in: 1..500 }

  def created_time_formatted
    created_at.strftime("%b %-d, %Y - %l:%M %P")
  end
  
end
