# coding : utf-8

namespace :data do

  task run_all: [
    :init_published_at
  ] do
  end

  task :init_published_at => :environment do
    BlogPost.published.each { |post| post.update_attributes!(published_at: post.created_at) }
  end

end
