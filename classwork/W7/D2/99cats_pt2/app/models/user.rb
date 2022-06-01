# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  user_name       :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
    validates :user_name, :password_digest, :session_token, presence: true
    validates :session_token, :user_name, uniqueness: true
    after_initialize :require_session_token!

    attr_reader :password

    def require_session_token!
      self.session_token ||= SecureRandom::urlsafe_base64
    end

    def reset_session_token!
      self.session_token = SecureRandom::urlsafe_base64
      self.save!
      self.session_token
    end

    def password=(password)
      self.password_digest = BCrypt::Password.create(password)
      @password = password 
    end

    def is_password?(password)
      password_object = BCrypt::Password.new(self.password_digest)
      password_object.is_password?(password)
    end

    def self.find_by_credentials(user_name, password)
      user = User.find_by(user_name: user_name)
      if user
        if user.is_password?(password)
          return user
        end
      end
      nil
    end

    has_many :cats,
      class_name: :Cat,
      foreign_key: :user_id,
      primary_key: :id

    
end


