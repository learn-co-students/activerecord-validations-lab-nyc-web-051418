class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }

  STRINGS = [
  "Won't Believe",
  "Secret",
  /Top [0-9]*/i,
  "Guess"
]

def is_clickbait?
  if STRINGS.none? { |str| str.match title }
    errors.add(:title, "False, no Clickbait")
  end
end
end
