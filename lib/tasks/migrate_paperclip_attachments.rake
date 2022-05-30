# frozen_string_literal: true

namespace :migrate_paperclip do
  desc 'Migrate the paperclip attachments'
  task move_attachments: :environment do
    Rails.application.eager_load!

		errors = []
		error_ids = []

		attachments = Image.column_names.map do |c|
			Regexp.last_match(1) if c =~ /(.+)_file_name$/
		end.compact

		attachments.each do |attachment|
			migrate_attachment(attachment, errors, error_ids)
		end

		report_errors(errors, error_ids) unless errors.empty?
  end
end

private

def migrate_attachment(attachment, errors, error_ids)
  Image.where.not("#{attachment}_file_name": nil).find_each do |instance|
    bucket = ENV['S3_BUCKET_NAME'] 
    region = ENV['S3_REGION']

    instance_id = instance.id
    filename = instance.send("#{attachment}_file_name")
    extension = File.extname(filename)
    content_type = instance.send("#{attachment}_content_type")
    original = CGI.unescape(filename.gsub(extension, "_original#{extension}"))

    puts '  [Image (ID: ' +
         instance_id.to_s + ')] ' \
         'Copying to ActiveStorage location: ' + original

    instance_path = instance_id.to_s.rjust(9, '0')
    instance_path = instance_path.scan(/.{1,3}/).join('/')

    url = "https://#{bucket}.s3.#{region}.amazonaws.com/images/#{attachment.pluralize}/#{instance_path}/original/#{filename}"

    begin
			puts "Paperclip URL: #{url}"
			puts "URI.open(url): #{URI.open(url)}"
			puts "Filename: #{filename}"
			puts "Content type #{content_type}"

      instance.send(attachment.to_sym).attach(
        io: URI.open(url),
        filename: filename,
        content_type: content_type
      )
    rescue StandardError => e
      puts '    ... error! ...'
      errors.push("[Image][#{attachment}] - #{instance_id} - #{e}")
      error_ids.push(instance_id)
    end
  end
end

def report_errors(errors, error_ids)
	puts ''
	puts 'Errored attachments:'
	puts ''

	errors.each do |error|
		puts error
	end

	puts ''
	puts 'Errored attachments list of IDs (use for SQL statements)'
	puts error_ids.join(',')
	puts ''
end
