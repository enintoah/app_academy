# == Schema Information
#
# Table name: artworks
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  img_url    :string           not null
#  artist_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Artwork < ApplicationRecord
validates :title, uniqueness: { scope: :artist_id } 
validates :title, :artist_id, presence: true 

  belongs_to :user,
    class_name: :User,
    foreign_key: :artist_id,
    primary_key: :id
    
  has_many :viewing_users,
    primary_key: :id,
    foreign_key: :artwork_id,
    class_name: :ArtworkShare

  has_many :shared_viewers,
    through: :viewing_users,
    source: :viewer

  has_many :comments,
    foreign_key: :artwork_id,
    primary_key: :id,
    class_name: :Comment,
    dependent: :destroy
end
