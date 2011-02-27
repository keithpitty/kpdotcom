desc "Delete all cached files"
task :sweep_cache do
  rm_rf File.expand_path("public/about.html", Rails.root)
  rm_rf Dir[File.join(Rails.root, "public", "blog*")]
  rm_rf File.expand_path("public/contact.html", Rails.root)
  rm_rf File.expand_path("public/index.html", Rails.root)
  rm_rf File.expand_path("public/services", Rails.root)
  rm_rf File.expand_path("public/blog/tags", Rails.root)
end