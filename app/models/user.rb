class User < ApplicationRecord
  include UrlShortener

  validates :full_name, :website_full_url, presence: true

  before_create :generate_google_url

  after_create :get_website_headers

  def generate_google_url
    self.google_short_url = generate_short_url(self.website_full_url)
  end

  def get_website_headers

  end
end
