class Event < Base
  belongs_to :client, dependent: :destroy
  has_and_belongs_to_many :plumbers

  as_enum :status, %i{pending done}, pluralize_scopes: false, field: { default: 0 }

  field :start_date, type: Date
  field :end_date, type: Date

  validates_presence_of :start_date, :end_date
end
