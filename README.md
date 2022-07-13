# README

## Accessing Web Application

Access the web application via the following link:
https://stark-fortress-29433.herokuapp.com

## Running Locally

* Clone this repo to your local machine
* Ensure Ruby version is 3.1.2
* Create a MYSQL database named 'we_are_the_champions'
* Start up MYSQL
* Edit database.yml file so that the 'username' and 'password' matches your MYSQL username and password
* Run `rails s` to start rails server
* Go to localhost:3000 in your browser to access the app

## How to use the application
### View Existing Teams
* Click 'View Teams' to view current teams in the database
### Creating Teams
* Click 'Create Teams'
* Enter input in the correct format (Eg. firstTeam 17/05 2) and submit to create teams
* Input field also accepts multi-line input to create multiple teams in a single user input
### View Existing Matches
* Click 'View Matches' to view current matches in the database
### Creating Matches
* Click 'Create Teams'
* Enter input in the correct format (Eg. teamA teamB 0 1) and submit to create matches
* Input field also accepts multi-line input to create multiple matches in a single user input
### Generate Results
* Click 'Generate Results' to view the rankings of the teams in each group
* Top 4 teams of each group (highlighted in green) will advance to the next round