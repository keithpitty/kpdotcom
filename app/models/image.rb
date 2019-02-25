class Image < ApplicationRecord
  has_attached_file :picture, styles: { thumb: '100x100>', large: '870x870>' }
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\Z/
end
