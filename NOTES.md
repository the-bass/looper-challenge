## Format the response according to JSON API Spec
To solve this, usually I would try to make sure we're modeling the data using ActiveModel (as usual with Rails) and then create `ActiveModel::Serializer`s with the `:json_api` adapter to produce the desired response body format. But since I was asked not to use the `active_model_serializers` gem here, I started to code a serializer on my own that gets this job done and is written general enough to add on to it in the future. The aim would basically be to bit by bit write a library for formatting data according to JSON API spec.

## API client for the front-end app
Assuming that the app is gonna grow in the future, it might be a good idea to write an API client and maybe use Redux or Flux.

## Making sure the whole app works correctly
In addition to tests for the API endpoints, I would suggest writing RSpec feature specs (with a JS driver) to test basic scenarios like: fill in search field -> click submit button -> expect output to be present etc.
