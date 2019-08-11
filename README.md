# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* Used paranoid gem for soft delete feature
Use following command to add soft delete feature to model:
rails generate migration AddDeletedAtToParanoiac deleted_at:datetime:index
