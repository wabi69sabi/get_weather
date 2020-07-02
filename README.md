# README

Basic rails app that makes calls to weatherbit.io and returns either current or forecast weather information. The response data is received in JSON and dumped into a view.

* Ruby version: 2.6.5

* System dependencies: Just rails and yarn

* There is no db and caching is done purely in rails without redis or any other external caching dependencies

* There are no fancy tests except the very basic controller tests since there are no models


## Important

This app won't work without a valid weatherbit.io API key.

### Refactor

Some obvious refactor could be done by removing duplicate code from the controller and creating a helper. There is also no linter that catches bad input and the views are double so they could be stuck into a partial.

### Units

Currently the temperatures are displayed in Celsius, but that can easily be adjusted.
