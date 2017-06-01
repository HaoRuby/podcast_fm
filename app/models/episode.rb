class Episode < ApplicationRecord
  belongs_to :podcast

  # attach image to episode called thumbnail
  has_attached_file :episode_thumbnail, 
  									styles: { large: "1000x1000#", medium: "550x550#" }
  									#default_url: "/images/:style/missing.png"
  validates_attachment_content_type :episode_thumbnail, 
  																	content_type: /\Aimage\/.*\z/

  # attach mp3 to episode
  has_attached_file :mp3
  validates_attachment  :mp3,
  											content_type: { content_type: ["audio/mpeg", "audio/mp3"]},
  											file_name: { matches: [/mp3\Z/] }
end
