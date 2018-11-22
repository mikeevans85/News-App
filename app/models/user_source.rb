class UserSource < ApplicationRecord
  belongs_to :user
  belongs_to :source

  validates :source_id, uniqueness: true
end
