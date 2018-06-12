class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length:{minimum:250}
  validates :summary,length:{maximum:250}
  validates :category, inclusion: { in: ["Fiction", "Non-Fiction"] }

  # def clickbait
  #   validator=["Won't Believe","Secret","Guess"]
  #   if
  # end
end

#
# "Won't Believe", "Secret", "Top [number]", or "Guess",
