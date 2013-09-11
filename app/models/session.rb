class Session < ActiveRecord::Base
  before_create { self.uuid = SecureRandom.uuid }

  validate :uuid, uniqueness: true, null: false
end
