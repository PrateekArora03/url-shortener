# URL Shortener

This is a url shortener API, build with Ruby On Rails 6.

## How to use `URL-Shortner`

1. Clone the repository by running the following command

```sh
$ git clone https://github.com/PrateekCodes/url-shortener.git
```

2. Now, go to the cloned directory

```sh
$ cd url-shortener
```

3. Install dependencies by running the following commands

```sh
$ bundle install
```

4. Setup the database

```sh
$ rails db:create db:migrate db:setup
```

6. Now we can execute following commands.

```sh
$ URL=https://bigbinary.com/jobs bundle exec rake app:encode

$ SHORTURL=https://short.is/tkLo2367 bundle exec rake app:decode
```

## How rake tasks works

```
URL=https://bigbinary.com/jobs bundle exec rake app:encode
```

The above rake task should print following statement in the terminal.

```msg
The shortened url of https://bigbinary.com/jobs is https://short.is/tkLo2367`.
```

```
SHORTURL=https://short.is/tkLo2367 bundle exec rake app:decode
```

The above task should print following statemetn in the terminal.

```msg
The original url of short url https://short.is/tkLo2367 is https://bigbinary.com/jobs
```

If the SHORTURL is not present in the database then print error message like shown below.

```msg
No original url was found for the  short url https://short.is/poliwe71
```

### Implementation

- Added `pinned` column in `urls` table with boolean value type and default value is `false`.
- On `/api/v1/urls` endpoint `index` action called and sent:-
  - List of all `urls` sent in Json format.
  - List order created in descending order based on value `updated_at`
  - All pinned item with value `true` moved to top.

### EndPoints

```YAML
index:
  method: "GET"
  path: "/api/v1/urls"

create:
  method: "POST"
  path: "/api/v1/urls"
  params: url: { original: "https://twitter.com" }

show:
  method: "GET"
  path: "/api/v1/urls/:short"

update:
  method: "PUT"
  path: "api/v1/urls/:short"
  params: url: { pinned: true }
```
