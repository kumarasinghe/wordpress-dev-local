# A Quick Local Development Environment for WordPress

## Installation

Install `docker desktop` and also `make` if needed. 

Then build wordpress and database containers:

    git clone git@github.com:kumarasinghe/wordpress-dev-local.git
    cd wordpress-dev-local
    make install

This will start `wp-dev-wordpress` and `wp-dev-db` containers. 
You can find WordPress at http://localhost

## Useful commands

#### Stop containers
    make stop

#### Start containers
    make start

#### Create a backup
    make backup label=test_backup_1
    
#### Restore a backup
    make restore label=test_backup_1

## Notes

#### Database connection

```
Host: wp-dev-db / localhost
Port: 3306
User: root
Password: rootpassword
Database: wordpress
```
