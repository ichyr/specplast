**PostGreSQL configuration**

- Installation

	sudo apt-get install postgresql-9.3 

- [Setting Up Postgres] (https://www.digitalocean.com/community/tutorials/how-to-setup-ruby-on-rails-with-postgres)

Set up postgres main password:

```
sudo -u postgres psql postgres
\password postgres
```

Create a Postgres user for the Rails app we'll create in the next step. To do this, switch into the Postgres user:

```
su - postgres
```

Then create a user (or a "role", as Postgres calls it):

```
            <app name>													<db pswrd>
create role myapp with createdb login password 'password1';
```

