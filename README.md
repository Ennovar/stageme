# Staging Hook API
_used to send requests for staging server running new projects_

## Setup
1. clone the project
```
git clone
```

2. the project is rails depenedent so please install rails enviroment instructions [here](http://installrails.com)
3. after installing rails you must create the database, the database is postgresql so please install that [here](https://www.postgresql.org)
4. to create the database run the following:
```
rake db:create #creates a database locally, check/edit config/database.yml file for db name and credentials
```
```
rake db:migrate # migrates the table structure to create tables
```
5. to start the server run the following
```
rails server -p <the_port_you_want_to_listen_on> -b 0.0.0.0
# or you can just run it default in development with the following
rails server -b 0.0.0.0
```
6. setup process is done

