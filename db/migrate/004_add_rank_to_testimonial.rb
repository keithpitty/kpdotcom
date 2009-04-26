class AddRankToTestimonial < ActiveRecord::Migration
  def self.up
    add_column :testimonials, :rank, :integer
  end

  def self.down
    remove_column :testimonials, :rank
  end
end
