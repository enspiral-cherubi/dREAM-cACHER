class DreamsController < ApplicationController
before_action :authenticate_user!, :only => [:mine]

  def index
    @dreams = Dream.order(created_at: :desc)
    render json: @dreams
  end

  def mine
    @dreams = current_user.dreams.order(created_at: :desc)
    render json: @dreams
  end

  def create
    @user = current_user || User.find_by_name('anonymous')
    dream_string = params['dream']
    analyzer = create_sentiment_analyzer
    tag_words = create_tag_words(dream_string)

    @dream = Dream.new({
      contents: dream_string,
      user_id: @user.id,
      sentiment: ((analyzer.get_score dream_string) / 10)
    })
    if @dream.save
      create_themes(tag_words, @dream)
      render json: @dream
    else
      render json: ({error: '............!'})
    end
  end

  def from_tag
    tag_word = params[:tag].downcase.strip
    tag = Tag.find_by_word(tag_word)
    themes = Theme.where(tag: tag)
    @dreams = themes.map { | theme | theme.dream }
    @dreams.sort_by! { |dream| dream[:id] }.reverse!
    render json: @dreams
  end



  private

  def retreave_tags(hash)
    hash.map do | k, v |
      k.downcase
    end
  end

  def create_themes(tag_words, dream)
    tag_words.each do | word |
      tag = Tag.find_or_create_by(word: word)
      Theme.create(tag: tag, dream: dream)
    end
  end

  def create_sentiment_analyzer
    Sentimental.load_defaults
    Sentimental.threshold = 0.1
    Sentimental.new
  end

  def remove_punctuation(tag_words)
    tag_words.map { | word | word.gsub(/\p{^Alnum}/, '') }
  end

  def create_tag_words(text)
    tgr = EngTagger.new
    tag_words = []

    # Add part-of-speech tags to text
    tagged = tgr.add_tags(text)

    # Get all nouns from a tagged output
    nouns = tgr.get_nouns(tagged)
    tag_words.push retreave_tags(nouns)

    # Get all proper nouns
    # proper = tgr.get_proper_nouns(tagged)

    # Get all the adjectives
    adj = tgr.get_adjectives(tagged)
    tag_words.push retreave_tags(adj)
    tag_words.flatten!
    remove_punctuation(tag_words)

  end


end
