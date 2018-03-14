module ContentPullable

  def pull_content(url)
    page = get_website(url)
    parse_header_tags(page)
  end

  def get_website(url)
    Nokogiri::HTML(open(url))
  end

  def parse_header_tags(page)
    ['h1','h2','h3'].map! do |tag|
      page.css(tag).map{|t| t.text.strip }
    end.flatten
  end
end