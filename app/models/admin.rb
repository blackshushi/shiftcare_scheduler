class Admin < Base
  field :name, type: String
  field :credentials, type: String

  validates_presence_of :name, :credentials
end
