# Todo List
[![Code Climate](https://codeclimate.com/github/ruan-brandao/todo-list/badges/gpa.svg)](https://codeclimate.com/github/ruan-brandao/todo-list)

## Dependencies
This project has the following dependencies:
* Ruby 2.2.2
* Rails 4.2.4
* PhantomJS 1.9.8 (used on the feature specs)

## Setup the project
To run the project, do the following steps
1. Install the dependencies above
2. `$ git clone <REPOSITORY_URL> todo-list` - Clone the repository
3. `$ cd todo-list` - Go into the project directory
4. `$ bundle install` - Install the project's gems
5. `$ bin/rake db:migrate` - Setup the project's database

If everything goes OK, you can now run the project.

## Running the project
1. Run `$ bin/rails server` on the project directory
2. Open [http://localhost:3000](http://localhost:3000) at your web browser

## Running the specs
Run `$ bin/rspec` to run the specs.

Note that the feature specs use PhantomJS as a driver for Capybara.
