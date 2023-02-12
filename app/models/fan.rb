class Fan < ApplicationRecord
    has_many :alliances, dependent: :destroy
    has_many :squads, through: :alliances
    has_many :messages
    validates :email, :name, presence: true
    validates :email, uniqueness: true
end