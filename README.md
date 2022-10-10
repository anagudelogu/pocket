![](https://img.shields.io/badge/Microverse-blueviolet)

# Pocket - Budget app

Planning your expenses is a must when you want to improve your financial life. Pocket lets you manage your budget: you have a list of transactions associated with a category, so that you can see how much money you spent and on what. Having your finance under the control you want.

## Live Demo

[Pocket app](https://pocket-budget-app.herokuapp.com/)

## Built With

- Ruby
- Rails
- Stimulus
- Hotwired turbo
- Rspec
- Capybara

## Getting Started

To get a local copy up and running follow these simple example steps.

### Prerequisites

- You should have ruby installed in your machine, you can follow the steps given by the [official documentation](https://www.ruby-lang.org/en/documentation/installation/).

- You should have a postgres user with superuser permissions. you can refer to the official [postgres documentation](https://www.postgresql.org/docs/current/role-attributes.html#:~:text=To%20create%20a%20new%20database,that%20is%20already%20a%20superuser.&text=A%20role%20must%20be%20explicitly,use%20CREATE%20ROLE%20name%20CREATEDB%20.) to create or update a role.

### Setup

First, you must clone this repository locally running this command:

```
git clone git@github.com:anagudelogu/pocket.git
```

and navigate to the cloned directory:

```
cd blog_app
```

### Install

Once inside the project directory, you should install all project dependencies:

- Install bundler:

```
gem install bundler
```

- Install project dependencies

```
bundle install
```

```
bundle exec rake assets:precompile
```

### Usage

You can get the app running locally by opening a local server:

```
bin/dev
```

### Run tests

If you're on a linux-based system, you could run the executable file to run all specs:

```
bin/rspec
```

Windows users have to specify ruby in this case:

```
ruby bin/rspec
```

## Authors

👤 **Andres Agudelo**

- GitHub: [@anagudelogu](https://github.com/anagudelogu)
- Twitter: [@AgudeloAndres\_\_](https://twitter.com/AgudeloAndres__)
- LinkedIn: [Andres Agudelo Guzman](https://linkedin.com/in/aagst)

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](https://github.com/anagudelogu/pocket/issues).

## Show your support

Give a ⭐️ if you like this project!

## Acknowledges

Special thanks to [Gregoire Vella](https://www.behance.net/gregoirevella) for the design.

## 📝 License

This project is [MIT](./LICENSE) licensed.
