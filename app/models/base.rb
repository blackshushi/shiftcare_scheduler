class Base
  include Mongoid::Document
  include Mongoid::Timestamps

  include Mongoid::History::Trackable

  include SimpleEnum::Mongoid

  field :active, type: Boolean

  default_scope -> { where(active: true) }
  scope :destroyed, -> { where(active: false) }

  def destroy
    self.update!(active: false)
  end
end
