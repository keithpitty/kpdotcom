class CreateTestimonials < ActiveRecord::Migration
  def self.up
    create_table :testimonials do |t|
      t.column :provider_name, :string
      t.column :provider_position, :string
      t.column :recommendation, :text
    end
  end

  def self.down
    drop_table :testimonials
  end
end
