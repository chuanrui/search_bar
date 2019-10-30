class Preference < ApplicationRecord
  belongs_to :user
  validates_uniqueness_of :user_id, :scope => :term
end
