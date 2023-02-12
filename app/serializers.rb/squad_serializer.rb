class SquadSerializer
    include FastJsonapi::ObjectSerializer
    attributes :name, :description, :image_url
    has_many :alliances
    has_many :fans, through: :alliances
end
