require 'rubygems'
require 'engtagger'
require 'pp'

# Create a parser object
tgr = EngTagger.new

# Sample text
text = "I remember that I was very relaxed, back at home in New York, on vacation. I was home alone just watching some TV, when suddenly the front door opened. I called out to ask who it was, and when there was no answer, I became nervous. Somehow I knew that it was a stranger--an intruder, and I began to panic. I ran out of the house, and this stranger followed me. It quickly became a chase, in which I had to keep running in order to survive. I found a building, and I ran inside to find some help. I found myself in Annaud, in the middle of a Sleep and Dreams lecture! Dr. Dement was saying names in the Sleep & Dreams lottery, and suddenly my name came up. I found myself unable to move, or to say aloud 'Drowsiness is Red Alert!' and I began to worry that I wouldn't be able to get bonus points and that everyone would think that I was skipping class. I woke myself up, sitting up in bed, screaming the words, DROWSINESS IS RED ALERT!!. I woke up my roommate and we both laughed about it later."

# Add part-of-speech tags to text
tagged = tgr.add_tags(text)

#=> "<nnp>Alice</nnp> <vbd>chased</vbd> <det>the</det> <jj>big</jj> <jj>fat</jj><nn>cat</nn> <pp>.</pp>"

# Get a list of all nouns and noun phrases with occurrence counts
word_list = tgr.get_words(text)

#=> {"Alice"=>1, "cat"=>1, "fat cat"=>1, "big fat cat"=>1}

# Get a readable version of the tagged text
readable = tgr.get_readable(text)

#=> "Alice/NNP chased/VBD the/DET big/JJ fat/JJ cat/NN ./PP"

# Get all nouns from a tagged output
nouns = tgr.get_nouns(tagged)

# p 'nouns'
# p nouns

#=> {"cat"=>1, "Alice"=>1}

# Get all proper nouns
proper = tgr.get_proper_nouns(tagged)

# p 'proper'
# p proper

#=> {"Alice"=>1}

# Get all past tense verbs
pt_verbs = tgr.get_past_tense_verbs(tagged)
# p 'pt_verb'
# p pt_verbs

#=> {"chased"=>1}

# Get all the adjectives
adj = tgr.get_adjectives(tagged)

# p 'adj'
# p adj

#=> {"big"=>1, "fat"=>1}

# Get all noun phrases of any syntactic level
# (same as word_list but take a tagged input)
nps = tgr.get_noun_phrases(tagged)
# pp 'nps'
# pp nps
# nps.each do | k, v |
#   p k
# end

#=> {"Alice"=>1, "cat"=>1, "fat cat"=>1, "big fat cat"=>1}

tag_words = []
def retreave_tags(hash)
  return hash.map do | k, v |
    k
  end
end

tag_words.push retreave_tags(nouns)
tag_words.push retreave_tags(adj)
# tag_words.push retreave_tags(proper)


p tag_words.flatten