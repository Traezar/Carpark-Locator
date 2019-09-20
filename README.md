# Carpark Locator (Wego)
---------------
![onemap](https://docs.onemap.sg/images/logo.png)*

# Setup Instructions

## Compatibility Compliance

 ###### Ruby version (2.5.3) : `ruby --version`
 ###### Bundler version (2.0.1) : `Bundler --version`
 ###### Mysql-server (8.X.X) : `mysql --version`
 &nbsp;
> Gemlock wil prevent a bundle install if the Bundler version is older
---
# Mysql
###### Set the following Environment variables by entering these commands:
`export "MYSQL_USER="{user}"`
`export "MYSQL_PASS="{password}"`
##### Console into MySQL and change, By entering the following:
`mysql -u root -p`
When prompted for password hit Return
 When in the MySQL console enter the following.
`GRANT ALL PRIVILEGES ON *.* TO '{user}'@'localhost' IDENTIFIED BY {password}` 
&nbsp;
# Rails Application

###### Execute the following:
 ```
 bundle install
 rake db:setup
 rake total_lots
 rails server
 ```
The server should be listening to port `3000` on the `localhost`
 &nbsp;
### Assigned Tasks Completed:
### Rake Tasks:
`rake convert_and_store_csv` :
Extracts the Addresses from the csv file provided and populates the Database.
This code has been duplicated into seeds.rb file. 

`rake total_lots`:
Pulls the Carparks from the OneMapAPi and updates the "Known" addresses in the database. It pushes all other Carparks into an instance variable

### Rspec
`rspec` runs tests for the validation of the Model and Controller have been included.

# Major Issues Encountered
>
>Bundler 2 locking issue:
While attempting to Containerise. Travis flagged it as issue, &nbsp;
 should have taken this into consideration earlier into the project.
>
>MacOSX MySQL Dependencies:
> OSX seemed to have changed the libs for OpenSSL initial Setup

## Takeaways
> Test the Application in the 'Desrired Environment' earlier

### Todos
 - Dockerisation of the Rails App.
 - Figure a workaround the Bundler 2 issue 

##### Reference Library for SVY21:
https://github.com/cgcai/SVY21
##### License:
MIT
