class Episode < ApplicationRecord
  belongs_to :podcast

  has_attached_file :episode_thumbnail, 
  									styles: { large: "1000x1000#", medium: "550x550#" }
  									#default_url: "/images/:style/missing.png"
  validates_attachment_content_type :episode_thumbnail, 
  																	content_type: /\Aimage\/.*\z/
end
