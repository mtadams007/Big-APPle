# Big APPle

## USER STORY

The user is in NYC for a day. The user wants to eat Mexican food after visiting a history museum and Chinese food after visitng an art museum. 

## WHAT IS OUR PRODUCT?

A travel app built on Rails, limited breaks in NYC (12-48 hours). Creates an itinerary based around a users interests, available time and budget.

## WHAT PROBLEM DOES IT SOLVE?

Condenses an overwhelming amount of information, into an easy plan for a weekend. Removes the time consuming planning for those unfamiliar with NYC.

## WHAT ARE OUR MVP FEATURES?

Mobile responsive app
Users should be able to:
create/sign up for an account
login into their account
logout of their account
favorite/star their saved searches
edit their profile
change their password
ability to showcase/share itinerary publicly
User can save/print? Itinerary
Users itinerary will include two museums, dinner and lunch schedule
Restaurants - Yelp (API)
Museums - Open NYC Database (By default, priority)
Optimal travel between (MTA) - (City Mapper API)
Pre-programmed itineraries
 
## WHAT ARE OUR POST-MVP FEATURES?

Weather - National Weather Service (API)
Cultural Events - Ticketmaster (API)
Parks - Open NYC Database
Street Food 
Hotels
Shopping areas
Bars/nightclubs
Making changes to itinerary 
Dates of trip
User can choose if the museum or restaurant is priority 
Allow choices based on budget: MTA, Uber, Taxi, CitiBike
The itinerary converted to downloadable PDF 
User can skip a suggestion they do not like
User can upload profile picture
Gem: Search Gem

## GEMS

Devise
Paperclip
Pagination 
Public Activity 
HTTParty (API calls)
Simple Form
Twitter Bootstrap Rails


## Getting Started

1. Run bundle install
2. $rails db:create
3. $rails db:migrate
4. $rails db:seed
5. Log in as test@test.com / pw: test123 (Username: Bruce Wayne)

## Deployment

Deployment will be through Heroku. 

## Built With

* [Ruby on Rails](http://guides.rubyonrails.org/) - The web framework used
* [Gems](https://rubygems.org/) - Gems to enhance the users experience 
* [Bootstrap](https://getbootstrap.com/) - Used to generate styling and forms
* [Devise](https://github.com/plataformatec/devise) - Used to generate user-friendly functions (i.e. logging in)

## Contributing

Michael Adams (https://github.com/mtadams007)
Jamie Grafton (https://github.com/jjgrafton)
Mashal Azhar (https://github.com/mashalazhar)

## Versioning

Ruby Version: 2.5.0 (https://www.ruby-lang.org/en/news/2017/12/25/ruby-2-5-0-released/)
