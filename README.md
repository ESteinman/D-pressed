# D-pressed

[![Coverage Status](https://coveralls.io/repos/github/CraftAcademy/D-pressed/badge.svg?branch=Development)](https://coveralls.io/github/CraftAcademy/D-pressed?branch=Development)

## Sad news for a sad world - June 2018 NewsRoom challenge

###  [Dpressed](https://d-pressed.herokuapp.com/ "Dpressed Homepage")


## Getting Started
These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites
In order to get the platform running, you need the following:

  - Rails version 5.2.1
  - Ruby version 2.4.3
  - Yarn
  - Bundler
In addition you need to install the following servers:

## Installation
In order to run the platform after cloning, you need to run bundler using:

`bundle install`

Database need to be created, migrated and seed loaded using the following

`rails db:create db:migrate db:setup`

## Running the tests
Dpressed uses Cucumber for acceptance test and Rspec for unit test.

To run the tests individually, use the following:

acceptance test:

`bundle exec cucumber`

unit test:

`bundle exec rspec`

To run both tests in one command, run:

`bundle exec rake`
