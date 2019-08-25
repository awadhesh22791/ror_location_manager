class Country < ApplicationRecord
    has_many :states
    validates :name, presence: true,length: {minimum:3,maximum:45}
    validates :short_name, presence: true, length: {minimum:2,maximum:45}
    validates :code, presence: true, length: {minimum:2,maximum:45}
end
