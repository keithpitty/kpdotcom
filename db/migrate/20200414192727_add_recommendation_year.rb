class AddRecommendationYear < ActiveRecord::Migration[5.2]
  def change
    add_column :testimonials, :recommendation_year, :integer
  end
end
