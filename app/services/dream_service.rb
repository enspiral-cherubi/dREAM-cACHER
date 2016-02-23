class DreamService
  def self.create(contents:, user:)
    dream = Dream.new(contents: contents, user: user)

    if dream.save
      tag_words_from(contents).each do |word|
        if tag = Tag.find_or_create_by(word: word)
          Theme.create(tag: tag, dream: dream)
        end
      end
    end

    dream
  end

  private
    def self.tag_words_from(content)
      tgr = EngTagger.new
      tag_words = []

      # Add part-of-speech tags to content
      tagged = tgr.add_tags(content)

      # Get all nouns from a tagged output
      nouns = tgr.get_nouns(tagged) || []
      tag_words << nouns.map { | k, v | k.downcase }

      # Get all proper nouns
      # proper = tgr.get_proper_nouns(tagged)

      # Get all the adjectives
      adj = tgr.get_adjectives(tagged) || []
      tag_words << adj.map { | k, v | k.downcase }
      tag_words.flatten!

      # remove punctuation
      tag_words.map { | word | word.gsub(/\p{^Alnum}/, '') }
    end
end
