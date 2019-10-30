# README

This program is built with Ruby on rails as backend tool and React as frontend tool

* Ruby version

2.6.3p62

* Database creation

using default sqlite to store user information and search history, the schema is located at app/db/schema.rb

* Functionalities

1.User authentication

Use bcrypt to achieve user authentication, and create search history for each user

2. Basic feature, filter results based on the input, if user has logged in, the search keywords will also contain user's name. e.g. If alice has logged in and she types 'bob' in search bar, this program will take both 'alice' and 'bob' as search keywords to filter the results. The search bar also support mutiple input, such as 'alice acme bob', the results will be shown based on 'alice', 'acme' and 'bob'.

3. Advanced feature, autocomplete function based on user's search history. If alice has logged in and searched 'alice', 'bob' and 'acme', these three keywords would be recorded, next time when alice types 'a', there will be a dropdown list with 'alice' and 'acme' on it since these two terms start with 'a'.

* Run my program

enter folder acme_search, type 'rails s' in terminal and go to browser go to port:3000(localhost:3000), you can create new account by clicking sign up on the navbar, or you can log in with the existing account I created "username: testuser, passowrd: 1111"

* Other information
I have tested the basic functions using selenium such as CRUD operations on user and user preference and they work fine.