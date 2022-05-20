# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class User < ApplicationRecord
    validates :id, :name, presence: true

    has_one :enrollment, 
        class_name: :Enrollment, 
        foreign_key: :student_id, 
        primary_key: :id

    has_one :enrolled_courses, 
      through: :enrollment, 
      source: :course

    has_one :course,
      class_name: :Course,
      foreign_key: :instructor_id,
      primary_key: :id
end
