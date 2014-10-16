# Traitify Rails Application Example

This is an example application to show a simple implementation of the Traitify API in a Rails appliation.
To get started, clone the directory and run `bundle`.

``` bash

$ git clone https://github.com/traitify/traitify-rails.git
$ cd traitify-rails
$ bundle

```

Next, set the environment variables for the API host and your secret key. You can obtain a secret key from
the [developer portal](http://developer.traitify.com). Once you register on the site, you will be provided
a key as well as information on the API host.

``` bash

$ export TRAITIFY_API_HOST=https://api-sandbox.traitify.com
$ export TRAITIFY_API_KEY=<your_unique_secret_key>

```

Finally, run `rails s` and navigate your browser to `http://localhost:3000`

If you have questions, please contact [support@traitify.com](mailto:support@traitify.com)

