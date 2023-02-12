class AllianceSerializer
    include FastJsonapi::ObjectSerializer
    attributes :last_viewed
    belongs_to :fan
    belongs_to :squad
  end