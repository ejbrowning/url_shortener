# URL Shortener

This is a Ruby on Rails API which shortens input URLs. This was designed using `ruby 3.2.2` and `Rails 7.0.4.3`

## Installation

After pulling the url_shortener project, run `bundle install`

```bash
bundle install
```

## Database Creation

Make sure to run `rails db:create` and `rails db:migrate` in order to create and initialize the database which will store the long and short URL pairs. 

## Format of Input

This API works on GET requests and not POST requests. To send a URL to be shortened, use /encode?long=`<YOUR URL>`. To decode a shortened URL, use /decode?short=`<ENCODED URL>`. Sending either an invalid URL (one that does not follow the basic format of `https://...` or `http://...`) to /encode or an invalid shortened URL to /decode will result in 400 status.

## Encode Example
### Input:
http://127.0.0.1:3000/encode?long=http://gmail.com
### Output:
{"short":"http://short.est/jmBDgNgX"}

## Decode Example
### Input:
http://127.0.0.1:3000/decode?short=http://short.est/jmBDgNgX
### Output:
{"long":"http://gmail.com"}

## Invalid Long URLS:
- www.github.com
- yello
- http://12345

## Testing

To test the functionality of the service, run `rspec` in a terminal to use the supplied testers. The `encode_decode_spec.rb` file can be edited to include any additional tests that may be needed.

