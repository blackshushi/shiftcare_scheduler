class Event < Base
  has_one :client, dependent: :destroy
  has_many :plumbers

  field :active, type: Boolean

  default_scope -> { where(active: true) }
  scope :destroyed, -> { where(active: false) }

  private
  def destroy
    self.update(active: false)
  end
end
