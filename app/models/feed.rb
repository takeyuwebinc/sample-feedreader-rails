class Feed < ApplicationRecord
  validates :url, format: /\A#{URI::regexp(%w(http https))}\z/

  def self.channels
    all.map { |feed| RSS::Parser.parse(feed.url).channel }
  end
end
