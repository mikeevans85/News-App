class UserSource < ApplicationRecord
  belongs_to :user
  belongs_to :source

  validates :source_id, uniqueness: true

  def blech
    @source = Source.where(user_id: current_user.id)
    urls = []
    @source.each do |key, value|
      if key == "api_url"
        urls << value
      else
      end
      return urls
    end
  end
end
