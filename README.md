# Lunar Fight Club - Recruitment Task

## Few words from author

First of all excuse me for poor UI/UX(only included Bootstrap), there is a lot space for improvement, but I have decided to focus more on back-end.

One thing does not meets specification - validate number of skills for fighter

I feel like associations between Fighter and Fight model might be a bit complicated, but I have not figure out better solution yet.

I have tried to stick with RoR convenction that encurage to write thin controllers. I accomplished it by including [`Decent Exposure`](http://decentexposure.info/), I wrote only actions that are required, there is no update and delete actions for both controllers.

Also I wrote one simple decorator.

Settle fight is trivial a this moment, but I see a great way of improvement - more at the end.


##Technology Stack

| Name |  Version |
| :--: | :---: |
| [Ruby](https://www.ruby-lang.org) | 2.3.0 |
| [Ruby on Rails](http://www.rubyonrails.org/) | 4.2.5.1 |
| [PostgreSQL](http://www.postgresql.org/) | 9.3 |

##Setup
Application uses Paperclip which require ImageMagick to be installed, make sure to install it before and configure your path in `config/environments/development.rb`. Default: `Paperclip.options[:command_path] = "/usr/local/bin/"`

1. `mv config/database.yml.sample database.yml` and if needed add your setting
1. `mv config/application.yml.sample application.yml`
1. `rake db:create`
1. `rake db:migrate`
1. `rake db:seed`
1. `rails s`

##Specification

####Add fighters.
Each fighter should have a first name, a last name, description and an avatar.

####Add skills to each fighter.
Each skill should have a name and a number describing fighter level (0-5).
Each fighter should have multiple skills (at least 2, but not more than 9).
The skill level of a fighter never changes. eg. Flying: 5, Yellow: 2, Running: 1, Jumping: 3

####Add fights by selecting 2 previously added fighters.
The fight is won automatically by a fighter with higher skills level and more experience points. The exact rules are up to you.
Fighters get experience points after each fight. The exact rules are up to you.

####Visit each fighter’s page.
With basic information and some statistics about the fights/points etc.

####Visit ranking page and see all fighters.
The ranking algorithm is up to you.

##td;dr

I see great way of improving fights.

Characters have 10 points to spent for 2 - 9 skills. Skills have archetype, smiliar to this:
![alt text](http://www.umop.com/images/rps9.jpg "Archetypes")

At the start of the fight skills for both fighters are chosen randomly, if skills are the same higher level wins.


Ranking can be improved by implementing Elo rating system.
