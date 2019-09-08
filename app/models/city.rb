class City < ApplicationRecord
    belongs_to :state
    validates :name, presence: true,length: {minimum:2,maximum:50}
    validates :state_id,presence: true
end