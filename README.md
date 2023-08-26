# README

* Ruby version
  - ruby 3.0.0p0

* Rails version
  - Rails 7.0.7.2

* System dependencies
  - postgresql

* Configuration
  - bundle install

* Database creation
  - rake db:create

* Database initialization
  - rake db:migrate

* How to run the test suite
  - rspec spec/

* API Endpoints
    - 1. To create course with tutors use below API endpoints
    >
      curl --location 'localhost:3000/api/v1/course' \
      --header 'Content-Type: application/json' \
      --data-raw '{
      "course": {
          "title": "Programming 103",
          "description": "Introduction to Programming",
          "tutors_attributes": [
          {
              "first_name": "ben",
              "last_name": "Doe",
              "email": "ben@example.com"
          },
          {
              "first_name": "john",
              "last_name": "Smith",
              "email": "john@example.com"
          }
          ]
      }
      }
      '

    - 2. To list all courses with tutors data use below API endpoints
    >
      curl --location 'localhost:3000/api/v1/course' \
      --header 'Content-Type: application/json'

* ...
