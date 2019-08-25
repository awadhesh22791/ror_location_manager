class State < ApplicationRecord
    belongs_to :country
    validates :name, presence: true, length: {minimum:3,maximum:45}
    validates :short_name, presence: true, length:{minimum:2}
    validates :country_id, presence: true
end