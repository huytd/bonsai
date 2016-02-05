require 'nokogiri'
require 'open-uri'
require 'readability'

def strip_html_tags(string)
    ActionView::Base.full_sanitizer.sanitize(string)
end

@news = Nokogiri::XML(open("http://www.google.com/trends/hottrends/atom/feed?pn=p28"))

@news.xpath("//ht:news_item").each do |item|
    news_item_title = strip_html_tags(item.at_xpath("ht:news_item_title").inner_text)
    news_item_description = strip_html_tags(item.at_xpath("ht:news_item_snippet").inner_text)
    news_url = item.at_xpath("ht:news_item_url").inner_text
    if not News.exists?(url: news_url)
        feed = News.new
        feed.title = news_item_title
        feed.description = news_item_description
        feed.url = news_url
        feed.content = Readability::Document.new(open(feed.url).read, :attributes => %w[src href], :tags => %w[div p h1 h2 h3 h4 h5 b a img video span strong]).content
        feed.save
        puts "Saved '#{news_item_title}'"
    else
        puts "Already exist '#{news_item_title}'"
    end
end
