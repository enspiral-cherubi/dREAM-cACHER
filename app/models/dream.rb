class Dream < ActiveRecord::Base
  belongs_to :user
  has_many :themes
  has_many :tags, through: :themes

  validates :contents, length: { minimum: 1 }

  after_create :run_sentiment_analysis!

  private
    def run_sentiment_analysis!
      Sentimental.load_defaults
      Sentimental.threshold = 0.1
      analyzer = Sentimental.new
      sentiment = analyzer.get_score(self.contents) / 10.0
      self.update(sentiment: sentiment)
    end
end
