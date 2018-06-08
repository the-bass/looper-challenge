# README

For this challenge, we would like you to build a simple API that can return information for a `Title`.

A `Title` is represents a movie on a digital storefront or Platform, like Itunes, that has a number of purchase options, known as `Offer`s.

Create an endpoint that will return the JSON representation of a `Title`, given a `Title` `ID`. The response format should follow the [JSON API spec](http://jsonapi.org/examples/)

`/titles/101`

```json
{
  "data": {
    "title": "title",
    "id": "101",
    "attributes": {
      "name": "12 Strong",
      "platform": "itunes",
      "formats": ["HD", "SD"],
      "licenses": ["buy", "rent"]
    },
    "relationships": {
      "offers": [
        { "id": 101, "type": "offer" },
        { "id": 102, "type": "offer" },
        { "id": 103, "type": "offer" },
        { "id": 104, "type": "offer" }
      ]
    }
  }
}
```

JSON API allows you to include related entities, so the following request should return the following response:

`/titles/101?include=offer`

```json
{
  "data": {
    "title": "title",
    "id": "101",
    "attributes": {
      "name": "12 Strong",
      "platform": "itunes",
      "formats": ["HD", "SD"],
      "licenses": ["buy", "rent"]
    },
    "relationships": {
      "offers": [
        { "id": 101, "type": "offer" },
        { "id": 102, "type": "offer" },
        { "id": 103, "type": "offer" },
        { "id": 104, "type": "offer" }
      ]
    }
  },
  "included": [
    {
      "type": "offer",
      "id": 101,
      "attributes": {
        "format": "HD",
        "license": "buy",
        "price": 1399
      }
    },
    {
      "type": "offer",
      "id": 102,
      "attributes": {
        "format": "HD",
        "license": "rent",
        "price": 549
      }
    },
    {
      "type": "offer",
      "id": 103,
      "attributes": {
        "format": "SD",
        "license": "buy",
        "price": 999
      }
    },
    {
      "type": "offer",
      "id": 104,
      "attributes": {
        "format": "SD",
        "license": "rent",
        "price": 549
      }
    }
  ]
}
```

Things to keep in mind:
* What should happen if an invalid Title ID is provided?
* What should happen if we pass an invalid `include` parameter
* How can we be sure that everything is working?

Notes:
* You can use any gems that you like, but don't use any library that actually solves the problem itself.
* This shouldn't take more than a few hours. If you don't have time to complete it, don't worry - we're much more interested in how you approach the problem.
* If you want to provide more background on how you would have completed the problem, or any other notes, please put them in a NOTES.md file at the root of the project.

## Submitting your solution

Clone the repo and make your changes locally. When ready to submit, zip up the project and send it back to us.

To avoid problems with attachments being blocked, either send the file with Dropbox or WeTransfer.
