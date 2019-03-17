# Social Wiki App

The social wiki app is a Ruby-on-Rails application that allows users to create public and private Markdown-based wikis.

Or check out this demo
![alt text](https://raw.githubusercontent.com/cheneyshreve/blocipedia/master/app/assets/images/wikis_demo.gif)

## Some key features:
- users can create a free, standard account and have access to public wikis, or private wikis they are added to as collaborators
- users can sign up for a premium account to view and create private wikis and manage collaborators
- when a user downgrades their account from premium to standard, the wikis are made public

## Installation
- feel free to clone of download the source code from this repository
- all gems are listed in the Gemfile of this repository

## Setup and Configuration
Languages and frameworks:
- ruby
- Ruby-on-rails
- bootstrap-sass

Databases:
SQLite (Test, Development)
Postgres SQL (production)

Tools and Gems, for full list, please refer to the Gemfile:
- Devise (user authentication)
- RedCarpet (Markdown)
- Pundit (authorization)
- Stripe (payments, manage plans and subscriptions)
- Test Driven Development gems for RSpec (stripe-ruby-mock, pundit-matchers, better-errors)

Setup
- figaro and dotenv gems are stored in config.yml and added to .gitignore
- setup examples can found in config/application.example.yml

Running Blocipedia locally:
- clone the repository on gitload
```
$ bundle install
$ rake db:create
$ rake db:migrate
$ rails server
```
navigate to localhost:3000 in your web browser
