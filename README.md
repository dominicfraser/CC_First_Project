# CC_First_Project
Food deal finder web app using PostgreSQL/Ruby/Sinatra

## Food Tracker

Steven has an insatiable hunger for 'food'. However, he only has a limited budget, so prefers to go to places that have a deal on. He would like a way to track which deals are available at which places on a given day so that he can maximise his 'food' intake for minimum spending.

### MVP:

- Add a 'food' eatery
- Add 'food' available at an eatery and view them as a list
- Add a list of deals for an eatery where a deal has
   - Label string e.g. "Two For One Tuesdays"
   - A list of 'food' that deal applies to
   - The day that the deal is available on e.g. "Wednesday"

### Possible Extensions:

- Show the deals available by day of the week Mon - Sun
- Add a price to a 'food' and add a savings amount/percentage to a deal so it's clear how much Steven is saving
- Any other ideas you might come up with

##To run follow:

In top level folder:
- in terminal run: 
   - psql -d burritos -f db/burritos.sql
   - ruby db/seeds.rb
   - ruby app.rb

In browser:
- to use locally: http://localhost:4567/
- also see on: https://burrito-finder.herokuapp.com/
