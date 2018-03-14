class User < ApplicationRecord
  has_many :friendships
  has_many :friends, :through => :friendships
  has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
  has_many :inverse_friends, :through => :inverse_friendships, :source => :user

  acts_as_taggable # Alias for acts_as_taggable_on :tags
  acts_as_taggable_on :interests

  include UrlShortener
  include ContentPullable

  validates :full_name, :website_full_url, presence: true

  before_create :generate_google_url

  after_create :get_website_headers

  def generate_google_url
    self.google_short_url = generate_short_url(self.website_full_url)
  end

  def all_friends
    # Prolly can do this without making two calls to db
    friends + inverse_friends
  end

  def get_website_headers
    tags = pull_content(self.website_full_url)
    self.tag_list.add(*tags)
    self.save
  end
end
