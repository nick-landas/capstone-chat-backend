class Squad < ApplicationRecord
    has_many :alliances, dependent: :destroy
    has_many :fans, through: :alliances
    has_many :messages
    validates :name, :description, presence: true
  end