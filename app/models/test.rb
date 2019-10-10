class Test < ApplicationRecord
  def self.sort_titles_by_category(category_title)
    category_id = Category.find_by(title: category_title)
    where(category_id: category_id).order(title: :desc).pluck(:title)
  end
end
