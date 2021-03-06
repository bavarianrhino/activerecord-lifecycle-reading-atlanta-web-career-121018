class Post < ActiveRecord::Base

  belongs_to :author
  validate :is_title_case

  before_validation :make_title_case
  # before_save :make_title_case ////Runs/Called after validation is run

  # before_save :email_author_about_post
  # ////Runs after post has been saved to the database...but wont send if post is invalid.


  private

  def is_title_case
    if title.split.any?{|w|w[0].upcase != w[0]}
      errors.add(:title, "Title must be in title case")
    end
  end

  def make_title_case
    self.title = self.title.titlecase
  end

end
