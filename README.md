# 🏍️ Gremlin Bell 🏍️

A progressive web app built with Rails, designed as a social network for motorcycle enthusiasts in Japan to create, share, and discover motorcycle routes.

This app was built to eliminate the hassle of visiting numerous social networking sites, no-longer active forums, and random 15 year old blog entries in order to find an interesting route to ride.

#### [www.gremlin-bell.bike]()

<img src="https://github.com/user-attachments/assets/65d4014b-e4fc-411b-aabd-796f133b5416" alt="Gremlin Bell login screen" width="300" style="display: inline-block;"/>

<img src="https://github.com/user-attachments/assets/1a09d2a9-fe1c-4032-820c-ba42316066c1" alt="Gremlin Bell Dashboard" width="300" style="display: inline-block;"/>

<img src="https://github.com/user-attachments/assets/d9622307-041d-49a3-91c1-42f9000dc03a" alt="Gremlin Bell Route Page" width="300" style="display: inline-block;"/>

<img src="https://github.com/user-attachments/assets/06c16ba9-1a5a-4190-a040-01ebd1524d36" alt="Gremlin Bell Route Map" width="300" style="display: inline-block;"/>

<img src="https://github.com/user-attachments/assets/73194d73-a522-4072-a69b-74f9a601334b" alt="Gremlin Bell Route tags, recommendations, and reviews" width="300" style="display: inline-block;"/>

<img src="https://github.com/user-attachments/assets/47e3141d-c6d6-4d1e-817a-7b1c2f69de6f" alt="Gremlin Bell Route tags, recommendations, and reviews" width="300" style="display: inline-block;"/>

<img src="https://github.com/user-attachments/assets/ea6a2238-e314-4f49-9e06-4243e1cdc702" alt="Gremlin Bell Route creation" width="300" style="display: inline-block;"/>

<img src="https://github.com/user-attachments/assets/8ec26c1a-14b1-428e-9c07-7656b2e29390" alt="Gremlin Bell inbox" width="300" style="display: inline-block;"/>

<img src="https://github.com/user-attachments/assets/9fd27fc0-7759-4640-8c81-301196be6105" alt="Gremlin Bell real-time chat" width="300" style="display: inline-block;"/>

## Getting Started

### Setup

Install gems
```
bundle install
```

### APIs used:

*  Cloudinary – used for hosting user uploaded 
images

* Mapbox – used for displaying and creating user routes

* OpenWeather – used for displaying a route’s current weather as well as a two-day forecast
(all the APIs used in this project are free! 😎)


### ENV Variables
Create `.env` file
```
touch .env
```
Inside `.env`, set these variables.
```
CLOUDINARY_URL=your_own_cloudinary_url_key

MAPBOX_API_KEY=your_own_mapbox_url_key

OPENWEATHER_API_KEY=your_own_openweather_url_key

```

### DB Setup
```
rails db:create
rails db:migrate
rails db:seed (the seeding takes a while so maybe make some ☕️ or do some 🧘‍♀️)
```

### Run a server
```
rails s
```

## Built With
- [Rails 7](https://guides.rubyonrails.org/) - Backend / Front-end
- [Stimulus JS](https://stimulus.hotwired.dev/) - Front-end JS
- [Heroku](https://heroku.com/) - Deployment
- [PostgreSQL](https://www.postgresql.org/) - Database
- [Bootstrap](https://getbootstrap.com/) — Styling
- [Figma](https://www.figma.com) — Prototyping

## Team Members
* [Andrew Beckett](https://github.com/Timbit87)
* [Chika Sakai](https://github.com/chikasss)
* [Steven Reyes](https://github.com/StevenEReyes)
* [Narumi Katayama](https://github.com/narumikat)

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.
