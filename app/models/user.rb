class User < ApplicationRecord
  validates :full_name, :website_full_url, presence: true
end
