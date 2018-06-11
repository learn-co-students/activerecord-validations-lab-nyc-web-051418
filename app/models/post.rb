class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
  validate :is_clickbait?

  @@titles = [/Won't Believe/, /Secret/, /Top/, /Guess/]

  def is_clickbait?
    if @@titles.none? {|clickbait| clickbait.match(title)}
      errors[:title] << "This isn't clickbait!"
    end
  end
end
