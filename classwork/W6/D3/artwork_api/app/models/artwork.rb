class Artwork < ApplicationRecord
validates :title, uniqueness: { scope: :artist_id } 
validates :title, :artist_id, presence: true 

end
