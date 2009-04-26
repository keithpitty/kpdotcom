desc "Delete all cached files"
task :sweep_cache do
  rm_rf File.expand_path("public/about.html", RAILS_ROOT)
  rm_rf Dir[File.join(RAILS_ROOT, "public", "blog*")]
  rm_rf File.expand_path("public/contact.html", RAILS_ROOT)
  rm_rf File.expand_path("public/index.html", RAILS_ROOT)
  rm_rf File.expand_path("public/services", RAILS_ROOT)
  rm_rf File.expand_path("public/blog/tags", RAILS_ROOT)
end