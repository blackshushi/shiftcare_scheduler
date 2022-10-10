class Client < Base
  has_many :events, dependent: :destroy

  field :name, type: String
  field :age, type: Integer
  field :address, type: String
  field :private_note, type: String

  validates_presence_of :name, :age, :address
end
