# ReadMe Metrics Ruby SDK - Sample Sinatra Application

This repository contains a sample Sinatra application configured with the [Readme
Metrics middleware](https://github.com/readmeio/metrics-sdks/tree/master/packages/ruby).

## Setup

You will need an account for the [ReadMe Dashboard](https://github.com/thoughtbot/metrics-sdk-rack-sample/blob/master/dash.readme.com) to create a project and obtain an API key.

Install dependencies

```
bundle install
```

Set up environment variables:

```
copy .env.sample .env
```

Edit the `.env` file to set your Readme API key

## Run the application

In the root of the project, run:

```
ruby app.rb
```

By default this will run the app at `http://localhost:4567`

## Authentication

The application uses HTTP Basic Auth. You'll need to pass a header that contains
the base64-encoded username:password string. For example, for the default
username and password you would send a header that looks like:

```
Authorization: Basic U2luYXRyYSBVc2VyOkFQSV9LRVk=
```

## Making requests

Make requests via cURL or your API exploration app of choice. For example:

```
curl http://localhost:4567/api/users -H 'Authorization: Basic U2luYXRyYSBVc2VyOkFQSV9LRVk='
```

## Configuring the Readme::Metrics middleware

By default, the middleware is configured to strip out the key `Authorization` so
that we don't send sensitive data to Readme. It also does not batch any
requests. Because there is only a single user, we hardcode the user info sent
along with every request. If you were using Devise or some other Warden-based
middleware, you could read the currently authenticated user out of the rack env
yielded to the block.

Note that the `Readme::Metrics` middleware should be placed _after_ any
authentication middleware you are using.

See the [docs for the Ruby SDK](https://docs.readme.com/metrics/docs/ruby-api-metrics-set-up) for more info on configuration options.
