require 'sentimental'

def create_sentiment_analyzer
  Sentimental.load_defaults
  Sentimental.threshold = 0.1
  Sentimental.new
end

analyzer = create_sentiment_analyzer

User.delete_all
Dream.delete_all
Tag.delete_all
Theme.delete_all



users = []
tags = []
dreamsContent = [
  "I was in my bed and my sister was in a bed parallel to mine, she was jumping up and down with a bucket of popcorn in her hand singing some kind of army cadence. The popcorn kernels looked more like seashells than popcorn. Something about it scared me, so I crawled out of my bedroom window, ran across the street to my neighbor's house, they were all standing there like they expected me. Then they asked me to crawl out of their window, they wanted to see me do it again. So I did, but the ground beneath was on fire. I jumped, landed in the fire but the fire was orange and yellow cardboard when I got to it. I jumped up and ran across the street back to my home, ran into my mom's room and she was spreading peanut butter across her bare ass for some reason. I thought it was poop at first, but she assured me it was peanut butter. That's all I remember.",
  "In 8th grade science class, i was doing a research project on brain hemorrhages, and the evening before this dream, i had asked my mom a few questions about my hemorrhage. That night, i saw myself in my dream. I see most of my dreams from third person. In this particular dream, i was viewing it from up in the corner of two walls, by the cieling. Across the room there was a bed with a baby lying on it. Standing between my viewing spot and the bed were a man and a woman. I only saw them from behind, but they appeared to be my parents. The room was completely silent except for the slow but steady beep...beep...beep of the heart rate monitor. Then suddenly, the room went completely silent. Seconds later, the silence was broken by the woman crying. The man hugged her, and i woke up. The next morning, when my mom asked me how well i slept (as she usually did in the morning) i told her about the dream. I described every last detail of the room; how many windows and where, the color of the wallpaper, and the floor. Even the color of the clothes the little child was wearing. And she said everything in my dream was exactly the same as the hospital room i was in 11 years earlier. Neither of my parents had ever described the room to me before. TL;DR saw baby me die of a condition i had (IRL) as a baby, hospital room in dream perfectly matched room i was actually in, never heard a discription of the room before my dream",
  "I'm transported to a land without a sun and have to travel the countryside with a whole bunch of children who wear masks. It's a reoccurring dream that gets longer each time and each time the children warn me that one day I will not wake up from it, doomed forever to walk the land without a sun with a mask over my face much like the children. Throughout our travels, we meet very many horrible creatures not unlike things you might see in silent hill, and due to my traveling companions being children armed with pointy sticks, we don't fight them very well. The children each claim that at one time they too came from the land with a sun and still believe them to be in a very long dream, they worship the sun and hope for the day it will return to them. The children seem to be from many different time periods and countries and no two of their masks are alike. The dreams seem very realistic, the lands I travel through almost surrealistic, and the creatures we face are horrifying.",
  "I had a dream that my Biology Teacher was replaced by Snoop Dogg. We learned snoopology and the study of snoop. Fun dream.",
  "I was at the bank when a group of highly organised bank robbers took everybody in the bank hostage. Cue me, in typical action movie fashion, pulling some really badass stuff and taking out all of the robbers systematically. It got to the end the dream and as I was walking out of the bank with the girl I had fallen in love with, one of the not quite dead robbers lifted his gun with the last of his strength and shot me in the chest. As I was falling to the ground I looked at my reflection in the mirror. I was a young Bill Murray.",
  "I had a dream there was a whole Sky channel that was solely Beavis and Butthead's 'I am Cornholio I need TP for my bunghole.' On reapeat.",
  "I was just walking down the side of a very calm river. Almost still. It had a shiny blood-orange color to it. It's a clear day and there's not a cloud in the sky. Just a light breeze that rolls over the grass as I walk down the side of the river. All of a sudden, it feels almost like I get pulled into the river. I vaguely remember someone mentioning not to go into the water, but I can't remember why. Under the water feels heavy, and everything is tinted red. I feel really uneasy when my feet hit the strange rocky bottom. I thought someone said there wasn't a bottom? It doesn't seem deep at all. Maybe 6 or 7 feet. I reach up to feel the board walk I fell from and grab the side, preparing to lift myself out. I was heavy, and struggling to get myself out. It took every ounce of energy I had to pull myself from the water. I crawled passed the boards and onto the grass, looking back to make sure I'm far away from the water. I felt like it would reach out and snatch me back into it. My vision is tinted an odd orange color and I can't quite see that well, and my hearing is muffled. Later, I meet a friend at this place. I think he's my friend. He wants to go out onto the river. I go to walk over to him to tell him about a boat that a guy around the way has. He's just over there, and we can ask to borrow it. My friend goes to ask, and I go wait on the boardwalk by the river. Again, I feel as though I'm pulled back into the river. The heavy feeling, feet scraping the bottom, dark murky water devoid of any life that I can see... all over again. I struggle to reach for the boards and desperately, yet slowly, pull myself out. Through my orange blurry vision I see my friend running up, yelling something. My hearing is still muffled, so I only catch the end of what he said. 'If you keep screaming like that, they'll tell us to leave. Had I been screaming? I didnt realize I was... Why was I? He grabbed my arm to help me up, but I barely felt it. By this time the guy with the boat ran up asking 'You fell in that and got back out!?!' like it was some crazy thing that wasnt supposed to happen. I remember someone mentioning it had no bottom again. We were walking back towards the park the river ran next to, and I looked back at the river. In truth it felt like the river itself pulled me in and wanted me under the water.",
  "With a sonic boom I witness the rapture; a man-made rapture. A subsonic metal encasement, entering the earth from the stratosphere, death has an image. It has no ability to tell human from structure, it can't be stopped when started, it has no intelligence except that of a manufactured computer chip; a chip of destiny...? As I look to my flanks I can see the fields of which my dreams are made of, also the highway (the interstate) of which nightmares become twisted reality. Cars are zipping by with muted exhausts to my left, as cows and combines comb the fields to my right. As I ignore the lucidity of my environment, toxic rain falls fast in the form of a rocket from space. It is highly doubtful if any video of the vessel exists. From what I would imagine it either says U.S.A or U.S.S.R on the side (could be a relic from the past). The first explosion rocks my bones. I don't think i have ever experienced terror as such. However, the second penetration from the sky is much closer. How does one judge the energy wave from such terror? The answer is: you can not. I see a ditch by the highway, much too shallow to allow any comfort. So i stand tall and accept the fate that the 'heavenly powers' exert unto this land. What I see is boggling. What I fell is heat. What I smell, to me, is defeat. And I ask myself: 'How could this come to be? What has someone done wrong to justify this attrition? Where should I find myself when the wave of destruction is over?' The sad part is: no more life for me, no more life for the motorists passing by, no more life for the hobo on the corner begging for merciful nonsense, and certainly no more life for any nearest help. The one thing I can't stop contemplating, even here in this void, is what happens to my new-born baby girl? What happens to my beautiful wife? Or my step-son?What happens to this world when two egotistical 'leaders' decide to press their buttons at the same time? This is what I have seen. This should never be seen. This is a bad dream, so I think. To my left a scene with gory accidents due to the nuclear flash. I can't imagine the horror that every one else was experiencing. All i could think about was home. Yet, to my right I picture a field of grains wafting in the wind, I could almost feel the experience of drifting my fingers through the lightly colored stalks. The smell, the feel, and the aroma of a home cooked meal with family members of odd relativity all seemed so weirdly real. I knew then that my body was torn from flesh to skeletal matter to bone-dust in a matter of nano-seconds. I couldn't feel the death, but I realized, when I entered serenity, that I existed for a mere 28 years and such. The funny thing is, I always wanted to witness a nuclear explosion first-hand, with my own eyes.",
  "I met a girl; for recognition purposes when I talk about “she”, “her” or “the girl”, that’s her. She was brownish blonde, pretty, a bit tall and of slim build, looked like no one I know in real life, I cannot remember her face, it keeps shifting in my head, and she was strange, odd, gave the impression of knowing things no one else knew, and had an “old soul”, because even though she was around my age I guess, 18, almost 19, she had this melancholic and mature feel to her. She was always warm to the touch, so much so, that if you put a thermometer to her mouth, it would appear that she had fever, but she didn’t. To this characteristic of hers, the verse from the A song of ice and fire book series “For hands of gold are always cold, but a woman’s hands are warm” comes to my mind. In my dream, I was in some sort of vacation, with my family. Friends were there too. I don’t remember much about the beginning or middle, but two important things: • Being in a place that looked like my school, but way bigger, and there, doing fun stuff (I don’t remember what, but it was fun) with friends. • Being in a museum, and seeing my ex with her family there, like there was a dance or something she was attending to, and the girl of my dream and I acted like we were in a relationship, hugging and kissing, to make her jealous. This is the first time I remember seeing her, I don’t remember asking her to act like my girlfriend; I just remember acting like it in front of my ex. I fell in love with her towards the end of the dream, I don’t know how or when, I just remember feeling that way. There was a sickness, a fever most likely, in the town we were in, two little girls died, they (by this I mean that I just saw them in my mind’s eye, cuz no one actually showed them to me) showed thermometers that worked strangely, as if they used blood samples or something like that to show the temperature readings. In the last part of the dream, we were with friends in a house that looked like mine (actually exactly where I’m sitting writing this down right now), she’s giving all of us various things from a bag, like candy, lottery tickets (???, Powerball tickets specifically, I have no idea why the hell, because they are not relevant in my country at all, which is Guatemala by the way, in Central America) to me and our friends who were there with us, as if we had won something. Something happened with them, they got mad for some reason I don’t remember and all left, except me, her and another friend, called Cris. He says dumb but funny things to her, like “hey, we would have made a great couple, it would have been fun to grab your ass” (??? Lol, very close to what he actually said, I might have remembered a couple words wrong). We just laugh; It’s at this moment that I realize that I’m in love with her, and I guess she does too. We kiss and hug, and I ask her when we could be together, I guess vacation is coming to an end, and she’ll have to go, she said that she was going away with her sister, I ask her where, she doesn’t respond, I ask her when is she coming back, she just smiles sadly and just says never. I don’t understand. These next things that happened, happened very strangely, as in a movie, I wasn’t there physically, but as if watching through a camera. Next thing (like a movie shot) I see are two thermometers, laid out on a white/greyish table, with heirlooms (things that belonged to them, don’t remember if there’s another word for that, or if heirloom is the correct term) of the girl and her sister, indicating that they died of the town sickness. I scream. No, please no. Next “movie shot”, more thermometers appear, with heirlooms of me and my family. I’m still screaming. The very last thing I see is both our thermometers (hers and mine) going up, as if she and I were still warm. Hope. Then I woke up.",
  "I was in the Yellow Submarine with Sgt. Pepper and the Beatles And we flew to Japan and Crashed into the Studio Ghibli Headquarters And all of the Charecters ran out of the ruined building (Ponyo, The Yamadas, Totoro, Mei and Satsuki etc). Then the Beatles ran out and everyone started screaming: JOHN LENNON IS ALIVE!!!!! The i ran into John Lennon and i was taken away by security. I was in Jail and i drowned in the toilet while trying to escape. Then i woke up.",
  "I had a dream a few months ago that helped me feel better about things that have been complicating my life. It was just a short car ride with my dad that has been dead for 11 years in his old Volkswagen rabbit. All he did was talk about the Scorpions, but it was something I needed since I forgot the sound of his voice for so many years. It seemed so vivid so it was like spending a little bit of time with the person I wanted to see the most in the world",
  "When I was younger, round 8 or 9, I lost my copy of Pokemon Silver and it basically destroyed me. Then, about 1 year later, I had a dream that I found it out in the garage in a completely random spot. I woke up and sprinted out to the garage at like 3 in the morning and looked in the spot that my dream said it was and I couldn't believe my eyes. Right there before me was my Silver game. I sat on the floor of the dusty garage and played til breakfast. I was the happiest kid ever that day. TLDR: My dream told me where my Pokemon game was",
  "It started out with me waking up on my mattress floating in the middle of the ocean, about fifty feet or so from an island. When I looked over at the beach, I could see two islanders swimming towards me. Once they got to me, they asked where I came from and how I got there, but I was just as confused as they were. I told them I was from North Carolina, and I asked them how I ended up in the outer banks. They both looked at me completely dumbfounded, not having a clue what I was talking about. I didn't know where I was, but I certainly wasn't anywhere near home. There's a few breaks in the dream here and there, but they ended up taking me to their village where I met their local elder, hoping she could figure out how I got to this unknown island, and more importantly how I could get back home. When I met her, she lit some candles, threw around some purple dust on me, and placed her hand on my forehead. After a moment, she started speaking in another language, looking at the two islanders that brought me there. Both of them had this look of shock and joy upon hearing her, and they started jumping around me and hugging me and screaming with glee. I had no clue what was going on. Then there was another break in the dream, and the next thing I know I'm standing on the beach with all the islanders as this huge, like aircraft carrier sized pirate ship pulls up and drops anchor. From it emerges a group of what I guess were pirates with armor plaiting, and their captain.... Holy shit, this guy was bad. He was like if Blackbeard and Sauron had a baby, then threw it into the pits of Hell and Satan spat it back out. He was about seven feet tall, wore a black metallic mask that resembled a Tiki Face, and had this long cutlass with a shimmering red jewel in the hilt. For some reason, I instantly knew that these islanders were being oppressed by him, and their excitement earlier was because I was supposed to kill this guy. There's a few more breaks in the dream and a few more instances that I can't remember, but it ended with me and the islanders attacking this pirate ship, and getting into some awesome swashbuckling sword fighting. I wish I could remember all the details of the fight, but it was so long ago that I just can't remember much of it. But I do remember the combat came to a complete halt when the captain stepped out. He walked straight up to me and taunted me before drawing his sword and began to fight me while everyone else on the ship just gathered around in a circle and watched. For some reason I knew I didn't have to beat him, I just had to hold him off for a little bit. Well he started kicking my ass, but before he can land the killing blow the rear of the ship blew up. I guess some of the islanders were planting explosives during the battle. Anyways, we jump ship, the pirates drown because their armor weighs them down, and me an the rest of the islanders swim back to shore. It's sunset now, and we start all sharing a laugh about beating the pirates and saving the island, but then I hear this bloodcurdling roar that sent shivers own my spine. I look up at the ocean and see the captain trudging out of the ocean, his mask gone, revealing a skeletal face that looked like that of the Horned King from The Black Cauldron. Me and him engaged in one final battle on the sandy beach as the sunset framed the fight. Once again, I can't really remember the details of the battle, but I did strike the killing blow, and he instantly deteriorated into sand. With him dead, the islanders started screaming 'The sword! The sword!' I looked down at my feet to see the captains sword, and the jewel seemed to be shining even brighter than before. For some reason I knew that the sword had to be destroyed to free the islanders, so I picked it up and chucked it into the sun where it exploded into a beautiful display of fireworks. Then I woke up. The ending of that dream was by far the most triumphant moment I've ever felt, period. I felt so accomplished and so good that I saved all those people. Sometimes I wish that I'll have a dream where I revisit that island, but then again I can at least take solace in knowing that I saved them from the Pirate King.",
  "I love drawing cartoons and once spent a whole night creating new and unique characters, i then left my notepad by my bed and fell asleep. That night I dreamt of the characters I invented and they all came to life and I kinda met them and experienced all thier personalities. When I woke up I drew them all again as I saw them from the dream. ",
  "I can only remember myself in a plane. I was sitting with an old friend who left years ago. We parachuted out of the plane, and landed on a beach and walked into some urban town. We got into one of the buildings, and found tiger cubs. There were only cubs, not any grown tigers. My friend said 'this is what we're looking for!' and I helped him gather the cubs into a large carrier. Next thing I know, we were flying, not in a plane, but an empty water bottle. We landed at a roundabout in my town. There were no cars. Out of nowhere, Optimus Prime appeared and told us 'good job!' He then asked 'Did you learn anything?' We said yes, but he didn't ask what, and he drove off. TLDR; An old friend of mine and I captured tiger cubs and gave them to Optimus Prime.",
  "Invented a real, working light-saber. (Disclaimer: I'm not a huge Star Wars fan.) The energy required to form and maintain the 'blade' (whatever it's called) was so great that it created a bubble in space-time originating from the handle. Whoever was holding it was inside this bubble, so relative time for them passed much slower than for observers outside the bubble. That's how it was possible for the wielder to move ultra-fast (like deflect laser blaster shots.) Everything was backed by the iron-clad science of the dream. This isn't my best dream because I made a lightsaber, but because I was making ground-breaking discoveries and making science fiction reality. There was a fairly laborious (for a dream anyway) experimental process involved in inventing the thing. Everything made so much sense and seemed so damn scientifically reasonable. I was a lock for the Nobel Prize. then I woke up.",
  "I found a kangaroo on the side of the road which was quite sick. I nursed him back to health and we began many adventures together, saving the world, kicking villains ass, all kinds of extraordinary feats. It was simply incredible, I was living the dream so to speak. And then I woke up, and Goddammit if I didn't go to the place I found my pet kangaroo and search for him. I've never been so disappointed to wake up from a dream. One day my friend, one day we'll be together again.",
  "It was the zombie apocalypse, and I was sitting in a 'safe room' with a group of people, including my (at the time) favourite band. Someone in the room said 'Surviving the next zombie attack is going to be difficult.' I looked at the bassist of the band, and said 'Not as difficult as playing the intro to Panic Attack, AMIRITE!?' I then started laughing like crazy at my own joke. The bassist chuckled politely, but everyone else just stared at me in an awkward silence. I, however, could not stop laughing at this hilarious joke, and I eventually woke myself up from laughing so hard - I was actually crying with laughter, and it took me several minutes to calm down. I then realized how lame that joke was, and I felt ashamed.",
  "I dreamed that Obama saw me shoplifting from a grocery store and he frowned at me and gave me two disapproving thumbs down.",
  "I was riding my bike down my grandma's street, and I couldn't turn the handlebars. Then I thought 'hey, I know how to turn handlebars!' - and I realized I was lucid dreaming. 'ok, ok' I thought. 'I've got to take advantage of this'. With trepidation I cycled into a skate park. I slowly biked around, then faster, but my mind couldn't render the shapes fast enough, and the ground was grey and lumpy like crappy 3D 2000s cartoons. Then I woke up in my dream and told Will and Jasper about it. Then I woke up for realsies and was super confused."
]


user = User.create(
  email: "anonymous@anonymous.com",
  name: "anonymous",
  password: "asdfqwer",
  password_confirmation: 'asdfqwer'
)

user = User.create(
  email: "example@email.com",
  name: "test",
  password: "asdfqwer",
  password_confirmation: 'asdfqwer'
)
users.push user


# 30.times do
1.times do
  user = User.create(
    email: Faker::Internet.email,
    name: Faker::Internet.user_name,
    password: Faker::Internet.password(8)
  )
  users.push user
end


1.times do
# 1.times do
  dreamsContent.each do | dreamString |
    dream = Dream.create(
      contents: dreamString,
      sentiment: ((analyzer.get_score dreamString) / 10),
      user_id: users.sample.id,
    )
    dreams.push dream
  end
end



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
  # Get all proper nouns
  # proper = tgr.get_proper_nouns(tagged)
  # Get all the adjectives
  adj = tgr.get_adjectives(tagged)
  tag_words.push retreave_tags(nouns)
  tag_words.push retreave_tags(adj)
  tag_words.flatten!
  remove_punctuation(tag_words)

end



dreams.each do | dream |
  dream_string = dream.contents
  tag_words = create_tag_words(dream_string)
  create_themes(tag_words, dream)
end


