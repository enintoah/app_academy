# == Schema Information
#
# Table name: albums
#
#  id         :bigint           not null, primary key
#  band_id    :integer          not null
#  title      :string           not null
#  year       :integer          not null
#  category   :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Album < ApplicationRecord
  CATEGORIES = %w(live studio)
  validates :band_id, :title, :year, :category, presence: true
  validates :category, inclusion: {in: CATEGORIES}

  def self.categories
    return CATEGORIES
  end  

 
end
