class Plumber < Base
  field :name, type: String
  field :address, type: String
  field :vehicles, type: Array, default: []
end
