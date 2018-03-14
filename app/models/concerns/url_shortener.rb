require 'google/apis/urlshortener_v1'
module UrlShortener

  def generate_short_url(our_url)
    url = Google::Apis::UrlshortenerV1::Url.new
    url.long_url = our_url
    create_url(url).id
  rescue => e
    puts "Oh Noes! :( Google Errored"
    # log an error of some sort. Notify the user and someone that can debug.
  end


  def create_url(google_url)
    google_shortener_service = Google::Apis::UrlshortenerV1::UrlshortenerService.new
    google_shortener_service.key = Rails.application.secrets.google_api_key
    google_shortener_service.insert_url(google_url)
  end
end
