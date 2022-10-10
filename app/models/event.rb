class Event < Base
  belongs_to :client, dependent: :destroy
  has_and_belogns_to_many :plumbers

  as_enum :status, %i{pending done}, pluralize_scopes: false, field: { default: 0 }
end
