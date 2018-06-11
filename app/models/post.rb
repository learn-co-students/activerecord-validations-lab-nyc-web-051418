require 'pry'
class Post < ActiveRecord::Base

    CATEGORY_OPTIONS = ["Fiction", "Non-Fiction"]
    CLICKBAIT_BLACKLIST = ["Won't", "Believe", "Secret", "Top", "Guess"]

    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: { in: CATEGORY_OPTIONS }
    validate :is_valid?

    def is_valid?
      # binding.pry
      if self.title == nil || ( !self.title.include?("Top") && ( self.title =~ (/\d/) ) != nil ) || check_blacklist(self.title)
        false
      else
        true
      end
    end

    def check_blacklist(passed_phrase)
      passed_array = passed_phrase.split(" ")
      if (passed_array & CLICKBAIT_BLACKLIST).any?
        false
      else
        true
      end
    end
end

####more text to save
