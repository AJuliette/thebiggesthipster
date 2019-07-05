## Who's the biggest hipster ?

This is my implementation of the CaptainContrat jobs challenge :tada: <br/>
You can see instructions here: https://github.com/captaincontrat/jobs

## Version in production

The website is live here: http://whosthebiggesthipster.herokuapp.com

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

I completed the four levels of the Captain Challenge.
I left the branch `fightings` because for level 4 I had to re-arrange my tables and joints, I made quite a turn and wanted to let a branch open just in case...
Basically before level 4, games were related to characters with a has_many through fightings relationship.
I eventually decided to add directly the foreign_keys to games for both players and their weapons.

Looking forward to discussing it with you !

Have a nice review :eyes:
