**PostGreSQL configuration**

- Installation

	sudo apt-get install postgresql-9.3 

- [Setting Up Postgres] (https://www.digitalocean.com/community/tutorials/how-to-setup-ruby-on-rails-with-postgres)

Set up postgres main password:

```
sudo -u postgres psql postgres
\password postgres
```

Then create a user (or a "role", as Postgres calls it):

```
            <app name>													<db pswrd>
create role myapp with createdb login password 'password1';
```

- set up database.yml
```
development:
  adapter: postgresql
  encoding: unicode
  database: kickrstack_development
  **host: localhost**
  pool: 5
  username: kickrstack
  password: secret
```

- Create a new user and password and the user's new database:

postgres=# create user "guy_on_stackoverflow" with password 'keepitonthedl';
postgres=# create database "dcaclab_development" owner "guy_on_stackoverflow"; 

postgres=# create user "specplast" with password 'iii';
postgres=# create database "specplast_test" owner "specplast"; 
