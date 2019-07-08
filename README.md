## Who's the biggest hipster ?

This is my implementation of the CaptainContrat jobs challenge :tada: <br/>
You can see instructions here: https://github.com/captaincontrat/jobs

## Version in production

The website is live here: http://whosthebiggesthipster.herokuapp.com

## A bit of history

When I started to learn to code in autumn 2018 I quickly discovered the gem Faker that made me terribly laughed. This website is kind of a tribute to the Faker::Hipster :book:

## Usage

You can download the repo and then do:

```
bundle install
```

And check some tests with

```
rspec
```

## What I've done

I advise you to try the website out before reading this section, in order to understand what I'm talking about ! <br/>
I wanted to complete the four levels of the Captain Challenge and I had to take some design decisions in my code in order to do so.<br/><br/>
*Level 1*: I had the idea to make hipsters fight since the beginning of the project, I wanted to make a separate home page to explain the concept of the game, it then came handy after several levels to add links to players and past games.<br/>
I clearly wanted to show it off to my friends so I <i>did</i> spend a little extra time on design comparing to what was required, in order to make it pleasant to navigate.<br/><br/>
*Level 2*: In order to avoid imbalance between players I put some validations for the health points and attack damage. As they "talk" between each others, I couldn't make them with a lot of health points and powerful attack, otherwise there would have been too many lines and words, it would have been quite fastidious to read, hence the non-so-canonical number of health points and attack damage.<br/>
Users can create players and add profile pictures, I'd love that people use this site to create their hipster-version of self and make them fight (catharsis, you know ?)<br/>
A fun characteristic to add to players would be "Humble brags" with a bonus of 1 each, they would have a belongs_to relation to characters (characters having "has_many" humble brags, limited to a certain number), they could be created on the fly on the profile page of the characters.<br/><br/>
*Level 3*: When I first completed this level, games were related to characters with a has_many through fightings relationship. I added the gem `simple_form` which dealt with the has_many relationships pretty neatly, letting me create a game with two players associated with an unique form. I changed this when I arrived in level 4 (I'll explain why down below) but I let the branch `fightings` open with this implementation just in case (and to show you my original intent).<br/>
I made a simple turn-based game, each player attacking the other turn by turn. As a big fan of turn-based games, I think the fun in these is the strategic choices you make between each turns, as you only "assist" to fights here and don't make choice I didn't go for something complicated.<br/>
When I was polishing my code I received a Newsletter with an article about service objects in RoR, I started to wonder if my [game class](app/models/game.rb) didn't know too mush of other classes in its method `fight` and it's indeed call in the controller like a Service Object would but I didn't dig into this...<br/>
I also realise that my [turn class](app/models/turn.rb) is quite hungy in queries, I wanted to display the remaining points of each character at the beginning of the turn, there's probably a way to do it in a single update.<br/><br/>
*Level 4*: With what I made in level 3, I could add players but I didn't know how to assign them with weapons, because I couldn't "tag" the players in my form. I decided then to add directly the foreign_keys to games for both players and their weapons. It has obvisouly a cost because I could finish the game like that but I don't think it can evolve a lot. If we want to add players or equipment to games, we have to directly add these as foreign_keys to the games . So I would say that I compromised in order to make the game work as it is required and because I don't want to make it change after that, but otherwise I would have spent more times in order to keep my first implementation with fightings.<br/>

Looking forward to discussing it with you !

Have a nice review :eyes:
