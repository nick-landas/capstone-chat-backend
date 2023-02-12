class MessageSerializer
    include FastJsonapi::ObjectSerializer
    attributes :content, :created_at
    belongs_to :squad
    belongs_to :fan
  end