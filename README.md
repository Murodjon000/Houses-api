# Find your house API

This REST API was built with Ruby on Rails, and Postgres for the databases as the final project at Microverse. With this API, houses  can be added to database manually and favourites can be added by users.To see the fron-end of this app please check this [link](https://github.com/Murodjon000/houses-frontend)

## Main Features

- The database has 3 tables User,House and Favourite
- User table has username and using Devise for authentication
- House table has name, description, price, image, built_date, number_of_rooms, location
- Favourite belongs to House and User tables
- Houses and Favourites can be seen only by authorized users
- To authorize users, this app uses JWT and  Devise
- For cross site policy Rack-cors was used  
## Front-end

- The backend API for this project created by me and can be found in [github](https://github.com/Murodjon000/houses-frontendi).

## Built with

- Ruby
- Ruby on rails

## Getting Started

- Clone the repo `https://github.com/Murodjon000/Houses-api`
- cd `into` the project
- Run `git pull origin app`
- To install all dependencies and necessary gems, run `bundle installl`, `yarn install`
- Run rails `db:setup`
- Run `rails server` to run rails application in your local server
- To run tests write `bundle exec rspec` on the terminal

## Author

👤 **Murodjon Tursunpulatov**

- Github: [@murodjon000](https://github.com/murodjon000)
- Twitter: [@MurodjonTursun5](https://twitter.com/MurodjonTursun5)
- Linkedin: [@Murodjon Tursunpulatov](https://www.linkedin.com/in/murodjon-tursunpulatov-5189481b3/)

## 🤝 Contributing

Contributions, issues and feature requests are welcome!

Feel free to check the [issues page](issues/).

## Show your support

Give a ⭐️ if you like this project!

## 👏 Acknowledgements

- [Microverse](issues/)


## 📝 License

MIT License
