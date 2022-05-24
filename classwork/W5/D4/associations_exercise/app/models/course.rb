# == Schema Information
#
# Table name: courses
#
#  id            :bigint           not null, primary key
#  name          :string
#  prereq_id     :integer
#  instructor_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class Course < ApplicationRecord
    validates :id, :name, :prereq_id, :instructor_id, presence: true 

    has_many :enrollments,
      class_name: :Enrollment,
      primary_key: :id,
      foreign_key: :course_id

    has_many :enrolled_students, 
      through: :enrollments, 
      source: :user

    has_one :prereq,
      class_name: :Course,
      foreign_key: :id,
      primary_key: :prereq_id
      
    belongs_to :prereq1,
      class_name: :Course,
      foreign_key: :prereq_id,
      optional: true, 
      primary_key: :id
    
    belongs_to :instructor,
        class_name: :User,
        foreign_key: :instructor_id,
        primary_key: :id
end
