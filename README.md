# Microservices 

A secondary README.md is available in the `src/` folder showing the
steps taken. 

# Setup
1. Ensure Docker is installed
2. Run command: 
    `docker volume create data-postgres`

This is a workaround for an issue in which postgres does not allow
for volumes to be shared due to postgres permissions. 

3. `cd` into the root directory
4. Run `docker-compose up`

The server will appear via the url: [http://localhost:8080](http://localhost:8080)

# Constructed Compose File
LEPP development stack.

This development stack

# .env

You will need to set up a .env file in the root directory for the container to run:

- POSTGRES_DATABASE=app_db
- POSTGRES_USER=username
- POSTGRES_PASSWORD=password
- POSTGRES_ROOT_PASSWORD=rootPassword

The name of the db must remain as `app_db` for the container to work.

# Loading init.SQL 

A workaround for cases where the `init.SQL` does not run on startup.
`exec` in to the postgres container, and run the following command:<br /><br />

<code>
    <pre>
    psql -d app_db -U username -a -f docker-entrypoint-initdb.d/init.sql
    </pre>
</code>

This will create and populate all of the database tables. 

Note: `app_db` must remain the same, along with the path to `init.sql`, the username is the one you have specified in the `.env` file.

## Usage

Build Laravel file in src folder, or add php files to the "public/" directory. Run `docker-compose up -d --build` at root. Open browser to [http://localhost:8080](http://localhost:8080).

Three new available have been added that handle Composer, NPM, and Artisan commands without having to have these platforms installed on your local computer. Use the following command templates from your project root, modifiying them to fit your particular use case:

- `docker-compose run --rm composer update`
- `docker-compose run --rm npm run dev`
- `docker-compose run --rm artisan migrate` 

Containers created and their ports (if used) are as follows:

- **nginx** - `:8080`
- **mysql** - `:3306`
- **php** - `:9000`
- **npm**
- **composer**
- **artisan**
- **rabbitmq_management** - `:15672`
- **rabbitmq** - `:5672`