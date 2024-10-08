<div align="center">
    <img src="https://github.com/user-attachments/assets/b8be9c2d-e475-4fc3-aca3-bfe96c3e4093" alt="Logo">
</div>
  <h3 align="center">🏍️ Gremlin Bell 🏍️</h3>
  
# 
A progressive web app built with Rails, designed as a social network for motorcycle enthusiasts in Japan to create, share, and discover motorcycle routes.

This app was built to eliminate the hassle of visiting numerous social networking sites, no-longer active forums, and random 15 year old blog entries in order to find an interesting route to ride.


<div align="center">
  www.gremlin-bell.bike
</div>

# Built With

* [![RoR][Ruby on Rails Badge]][RoR-url] - Backend / Front-end
* [![Stim][Stimulus Badge]][Stimulus-url] - Front-end JS
* [![Heroku][Heroku Badge]][Heroku-url] - Deployment
* [![PostgreSQL][PostgreSQL Badge]][PostgreSQL-url] - Database
* [![Boostrap][Bootstrap Badge]][BootStrap-url] - Styling
* [![Figma][Figma Badge]][Figma-url] - Prototyping


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

## Screenshots

<div align="center">
  <div>
    <kbd>
      <img src="https://github.com/user-attachments/assets/65d4014b-e4fc-411b-aabd-796f133b5416" alt="Gremlin Bell login screen" width="300" style="display: inline-block;"/>
    </kbd>
    <kbd>
      <img src="https://github.com/user-attachments/assets/1a09d2a9-fe1c-4032-820c-ba42316066c1" alt="Gremlin Bell Dashboard" width="300" style="display: inline-block;"/>
    </kbd>
  </div>
  <div>
    <kbd>
      <img src="https://github.com/user-attachments/assets/d9622307-041d-49a3-91c1-42f9000dc03a" alt="Gremlin Bell Route Page" width="300" style="display: inline-block;"/>
    </kbd>
    <kbd>
      <img src="https://github.com/user-attachments/assets/06c16ba9-1a5a-4190-a040-01ebd1524d36" alt="Gremlin Bell Route Map" width="300" style="display: inline-block;"/>
    </kbd>
    <kbd>
      <img src="https://github.com/user-attachments/assets/73194d73-a522-4072-a69b-74f9a601334b" alt="Gremlin Bell Route tags, recommendations, and reviews" width="300"       style="display: inline-block;"/>
    </kbd>
  </div>
  <div>
    <kbd>
      <img src="https://github.com/user-attachments/assets/47e3141d-c6d6-4d1e-817a-7b1c2f69de6f" alt="Gremlin Bell Route tags, recommendations, and reviews" width="300" style="display: inline-block;"/>
    </kbd>
    <kbd>
      <img src="https://github.com/user-attachments/assets/ea6a2238-e314-4f49-9e06-4243e1cdc702" alt="Gremlin Bell Route creation" width="300" style="display: inline-block;"/>
    </kbd>
  </div>
  <div>
    <kbd> 
    <img src="https://github.com/user-attachments/assets/8ec26c1a-14b1-428e-9c07-7656b2e29390" alt="Gremlin Bell inbox" width="300" style="display: inline-block;"/>
    </kbd>
    <kbd>
    <img src="https://github.com/user-attachments/assets/9fd27fc0-7759-4640-8c81-301196be6105" alt="Gremlin Bell real-time chat" width="300" style="display: inline-block;"/>
    </kbd>
  </div>
</div>

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

[Ruby on Rails Badge]: https://img.shields.io/badge/Ruby%20on%20Rails-D30001?logo=rubyonrails&logoColor=fff&style=flat
[RoR-url]: https://guides.rubyonrails.org/
[Stimulus Badge]: https://img.shields.io/badge/Stimulus-77E8B9?logo=stimulus&logoColor=000&style=flat
[Stimulus-url]: https://stimulus.hotwired.dev/
[JavaScript Badge]: https://img.shields.io/badge/JavaScript-F7DF1E?logo=javascript&logoColor=000&style=flat
[JavaScript-url]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide
[Heroku Badge]: https://img.shields.io/badge/Heroku-430098?logo=heroku&logoColor=fff&style=flat
[Heroku-url]: https://heroku.com/
[PostgreSQL Badge]: https://img.shields.io/badge/PostgreSQL-4169E1?logo=postgresql&logoColor=fff&style=flat
[PostgreSQL-url]: https://www.postgresql.org/
[Bootstrap Badge]: https://img.shields.io/badge/Bootstrap-7952B3?logo=bootstrap&logoColor=fff&style=flat
[BootStrap-url]: https://getbootstrap.com/
[Figma Badge]: https://img.shields.io/badge/Figma-F24E1E?logo=figma&logoColor=fff&style=flat
[Figma-url]: https://www.figma.com
