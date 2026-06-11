# Secrets

Generate `config/master.key`:

```
bin/rails credentials:edit
```

Don't commit it!

That command ignores the `RAILS_ENV` variable.
You have to say this:

```
bin/rails credentials:edit --environment=test
# or
bin/rails credentials:edit -e test
```

That command generates both of these files:

```
config/credentials/development.yml.enc
config/credentials/development.key
```

If `config/credentials/${env}.key` exists, it is used to encrypt/decrypt the credentials yaml file.
Otherwise we use `config/master.key`.
If you have an environment-specific key for each environment, you don't need `master.key`.
In production, even better is to put the *contents* of the key in the `RAILS_MASTER_KEY` envvar, and have no file at all.

In other words you put it in the file `.kamal/secrets`.
This seems like a step backwards, since that file is not tracked by git.

So you need to find a place to save (1) the per-env credential keys (2) everything in `.kamal/secrets`.
That doesn't seem ideal.

You might still want to have a `config/credentials/production.key` in your local checkout, so you can run `bin/rails credentials:edit -e production`.


# Kamal

Kamal keeps production secrets in `.kamal/secrets` (though it used to use `.env`).
That file should have stuff like this:

```
KAMAL_REGISTRY_USERNAME=paul
KAMAL_REGISTRY_PASSWORD=sosecret
RAILS_MASTER_KEY=the-contents-of-config/credentials/production.key
PGHOST=localhost
PGPORT=5432
PGUSER=myapp
PGDATABASE=myapp
PGPASSWORD=anothersecret
```

Don't commit it!
Or https://www.ivanturkovic.com/2026/02/06/honest-take-kamal-rails-deployment/ says *do* commit it, but make everything a reference, like this:

```
KAMAL_REGISTRY_PASSWORD=$KAMAL_REGISTRY_PASSWORD
RAILS_MASTER_KEY=$(cat config/master.key)
POSTGRES_PASSWORD=$POSTGRES_PASSWORD
```

In that case what is even the point?


To deploy your app:

```
kamal deploy
```

I want to have nginx in front, terminating SSL and acting as a reverse proxy for several Rails apps, all deployed by Kamal.
I don't really care about kamal-proxy, and if it gets in the way I'll drop it.
Kamal 1 let you confirm the ports & IPs that kamal-proxy binds to, but Kamal 2 doesn't seem to let you do that.


