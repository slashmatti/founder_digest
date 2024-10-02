# FounderDigest
a give-and-get newsletter swap for founders seeking to learn from other users. Developed at [24 Hour MVP](https://founderhacker.com/24-hour-mvp).

## Installation
1. clone the repo
1. `cd founder_digest && bin/setup` (installs dependencies)
1. `cp config/application-sample.yml config/application.yml`

## Development
```sh
bin/dev # uses foreman to boot server, frontend, and bg job queue
```

## Testing
```
bundle exec rspec # run all tests inside spec/
bundle exec rspec spec/dir_name # run all tests inside given directory
```

## Deploying
install the [Heroku CLI](https://devcenter.heroku.com/articles/heroku-cli) and run `heroku login`. if repo admin has shared access to the server:

```
heroku git:remote -a heroku_app_name_here # you only need to do this once
git push heroku master # deploys master branch
git push heroku some_branch_name:master # deploys non-master branch
```

## Production management
to access the Rails console on the production server:
```
heroku run rails console
```
to add or update environment variables from your local `config/application.yml` file:
```
figaro heroku:set -e production
```
you will need Stripe and Postmark accounts, and then put in your API credentials as environment variables
