# == Schema Information
#
# Table name: enrollments
#
#  id         :bigint           not null, primary key
#  course_id  :integer
#  student_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Enrollment < ApplicationRecord
  validates :id, :course_id, :student_id, presence: true
  
  belongs_to :course,
    class_name: :Course,
    primary_key: :id,
    foreign_key: :course_id
  

  belongs_to :user,
    class_name: :User,
    primary_key: :id,
    foreign_key: :student_id
  
end
