user = User.find_by_login 'keithpitty'
unless user
  puts "Creating default admin user..."
  User.create(:login => "keithpitty", :password => "kpd0tc0m")
end

unless BlogPost.count > 0
  puts "Creating dummy blog post..."
  BlogPost.create(title: 'Testing', post: 'This is a dummy post.', published: true)
end
