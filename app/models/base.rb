class Base
  include Mongoid::Document
  include Mongoid::Timestamps

  include Mongoid::History::Trackable
end
