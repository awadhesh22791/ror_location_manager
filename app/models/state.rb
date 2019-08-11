class State < ApplicationRecord
    validates :name, presence: true, length: {minimum:3,maximum:45}
    validates :short_name, presence: true, length:{minimum:2}
end