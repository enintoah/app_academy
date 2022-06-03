module Toyable
  extend ActiveSupport::Concern

  included do
    has_many :toys,
      class_name: :Toy,
      foreign_key: :toyable_id,
      primary_key: :id,
      as: :toyable
  end

  def receive_toy(name)
    self.toys.find_or_create_by(name: name)
  end
end