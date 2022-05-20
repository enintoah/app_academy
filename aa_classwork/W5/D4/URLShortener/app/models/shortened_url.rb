# == Schema Information
#
# Table name: shortened_urls
#
#  id         :bigint           not null, primary key
#  long_url   :string           not null
#  short_url  :string           not null
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class ShortenedUrl < ApplicationRecord
  validates :long_url, :short_url, :user_id, presence: true, uniqueness: true 

  def self.random_code
    code = SecureRandom.urlsafe_base64
    unless ShortenedUrl.exists?("short_url" => code )
        return code
    else
      ShortenedUrl.random_code
    end
  end

  def self.create(user, long_url)
    new_user = ShortenedUrl.new
    new_user.short_url = ShortenedUrl.random_code
    new_user.long_url = long_url 
    new_user.user_id = user.id
    new_user.save!
  end

  belongs_to :submitter,
    class_name: :User,
    primary_key: :id,
    foreign_key: :user_id



end
