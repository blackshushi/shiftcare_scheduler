class Plumber < Base
  has_and_belongs_to_many :event

  field :name, type: String
  field :address, type: String
  field :vehicles, type: Array, default: []

  validates_presence_of :name, :address
end
