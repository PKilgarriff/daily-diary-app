# Daily Diary App

[![Build Status](https://app.travis-ci.com/PKilgarriff/daily-diary-app.svg?branch=main)](https://app.travis-ci.com/PKilgarriff/daily-diary-app)

## Description

Diary webapp written in ruby, used to store and refer to diary entries entered by a user.

## Setting Up

```zsh
git clone https://github.com/PKilgarriff/daily-diary-app
cd daily-diary-app
bundle install
```

### Database Setup

1. Connect to `psql`<br>
2. Run the following commands to create test and production databases:

```
CREATE DATABASE diary_manager;
CREATE DATABASE diary_manager_test;
```

*To-Do: Once the databases have been test-driven, put the appropriate set-up commands here*

## Running the Daily Diary App

Once you have followed the steps in [Setting Up](/README.md#setting-up) run the following commands:

1. ```rackup```
2. Connect to [localhost:9292](http://www.localhost:9292)
3. Follow the instructions within the interface

## Testing the Daily Diary App

Once you have followed the steps in [Setting Up](/README.md#setting-up) run the following commands.

1. ```rspec```
2. Browse the output in your terminal

## Approach

- Set up a repository with technologies that have proven useful for Testing and Development so far:
  - Sinatra
  - Capybara
  - RSpec
  - Postgres gem
  - SimpleCov
  - Rubocop
- Attempt to configure Travis CI
  - needed to explicitly add the linux environment to the Gemfile.lock with `bundle lock --add-platform x86_64-linux`
- Begin writing Skeleton Readme
- Write feature test for Homepage
  - pass with minimal implementation
    - expected string hard-coded in controller
- Set up config.ru and spec_helper to run DiaryApp
