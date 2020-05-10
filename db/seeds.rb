user = User.find_by_login 'keithpitty'
unless user
  puts "Creating default admin user..."
  User.create(:login => "keithpitty", :password => "kpd0tc0m")
end
