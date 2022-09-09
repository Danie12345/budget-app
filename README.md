![](https://img.shields.io/badge/Microverse-blueviolet)

## Budget App

> A classic budget app to keep track of your expenses by category, made with Rails, Turbo's Stimulus and Tailwindcss. It includes full user authentication and authorization. It also has fully tested functionality with unit tests and integration tests. Built within a week's work.

> Check out the free [Heroku demo](https://capstone-coin-track.herokuapp.com/)

## Built With

- Ruby on Rails
- PostgreSQL
- devise & cancancan
- rspec/rails & capybara
- bullet
- turbo & stimulus
- tailwindcss

### Getting Started

To get a local copy up and running follow these simple steps:

### Prerequisites

- Ruby ruby-3.1.2 installed
- PostgreSQL dbms running

## Setup Project

- Open your terminal and navigate to the folder you would like to save the project.

- Type these commands into the terminal:

```
git clone git@github.com:Danie12345/budget-app.git
cd budget-app
bundle install
```

- You will need a `.env` file before you install and run the project. The `.env` file contains environment variables needed to deploy the webpage. There is a commented `.env.example` file you can use as a guide to configure your own. Type the following command into the terminal (or Git Bash, if using Windows) to create your `.env` file:

```
cp .env.example .env
rails secret
```

- Edit file .env

  - Replace the value for the variable DEVISE_JWT_SECRET_KEY with the value returned by the `rails secret` command.
  - Provide values for DATABASE_HOST, DATABASE_USER and DATABASE_PASSWORD

- Type this command into the terminal to reset the database:

```
rails db:reset
```

### Run application

- Type this commands into the terminal:

```
rails server
```

- Open your web browser at [http://127.0.0.1:3000/](http://127.0.0.1:3000/)

### Run tests

- Type these commands into the terminal:

```
rspec spec -f doc lib
```

## Author

👤 **Daniel Malo**

- GitHub: [@Danie12345](https://github.com/Danie12345)
- Twitter: [@DanielMalo_v4](https://twitter.com/DanielMalo_v4)
- LinkedIn: [Daniel Malo](https://linkedin.com/in/daniel-malo)

---

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](https://github.com/Danie12345/budget-app/issues).

## Show your support

Give a ⭐️ if you like this project!

---

## Template

Full thank you to [Gregoire Vella](https://www.behance.net/gregoirevella) on [Behance](https://www.behance.net/) for the awesome [Snapscan - iOs design and branding](https://www.behance.net/gallery/19759151/Snapscan-iOs-design-and-branding) template! :)
