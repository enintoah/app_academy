# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class User < ApplicationRecord 
  validates :name, presence: true, uniqueness: true

  has_many :artworks,
    primary_key: :id,
    foreign_key: :artist_id,
    class_name: :Artwork,
    dependent: :destroy

  has_many :viewed_artwork,
    primary_key: :id,
    foreign_key: :viewer_id,
    class_name: :ArtworkShare,
    dependent: :destroy

  has_many :shared_artworks,
    through: :viewed_artwork,
    source: :artwork

    has_many :comments,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :Comment,
    dependent: :destroy

end
