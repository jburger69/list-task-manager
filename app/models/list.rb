class List < ApplicationRecord
    has_many :tasks
    has_many :user_lists
    validates_presence_of :name
    validates :name, length: { minimum: 2 }, presence: true
end
