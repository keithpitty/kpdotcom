# coding : utf-8

namespace :data do

  task run_all: [
    :init_published_at
  ] do
  end

  task :init_published_at => :environment do
    BlogPost.published.each { |post| post.update_attributes!(published_at: post.created_at) }
  end

  task init_recommendation_year: :environment do
    Testimonial.where(provider_name: 'Alan Harper').first.update!(recommendation_year: 2019)
    Testimonial.where(provider_name: 'James Healy').first.update!(recommendation_year: 2017)
    Testimonial.where(provider_name: 'Travis Winters').first.update!(recommendation_year: 2016)
    Testimonial.where(provider_name: 'Tim McGilchrist').first.update!(recommendation_year: 2015)
    Testimonial.where(provider_name: 'Sebastian von Conrad').first.update!(recommendation_year: 2015)
    Testimonial.where(provider_name: 'Ken Buckley').first.update!(recommendation_year: 2015)
    Testimonial.where(provider_name: 'Martin Stannard').first.update!(recommendation_year: 2014)
    Testimonial.where(provider_name: 'Matt Allen').first.update!(recommendation_year: 2012)
    Testimonial.where(provider_name: 'Alan Green').first.update!(recommendation_year: 2007)
    Testimonial.where(provider_name: 'Charles Miller').first.update!(recommendation_year: 2006)
    Testimonial.where(provider_name: 'Chris Fuller').first.update!(recommendation_year: 2006)
  end
end
