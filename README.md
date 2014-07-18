# OnSip for Ruby

Ruby gem that wraps the Onsip Admin API

http://developer.onsip.com/admin-api/

## Installation

Add this line to your application's Gemfile:

    gem 'onsip'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install onsip


## Getting Started

The Onsip for Ruby gem is currently in development and many things missing such as proper error handling.
It is not recommended to use this gem at the current time but and additions to the gem would be appreciated.

## Road Map

Planned Releases
v0.0.1 - Implement the Session actions and the CdrBrowse action
v0.0.2 - Implement proper error handling for http responses
v0.0.3 - Implement the remaining get requests

Releases

none yet :)

## Usage

### Authentication 
http://developer.onsip.com/admin-api/Authentication/#sessioncreate

Creating a Session
---

Before making any API calls you need to authenticate

Session returns a boolean indicating whether the session was made successfully.
Because the session is a singleton you don't need to store any session or pass
the session id to any further calls.

``` Session.instance.authenticate("username", "password")


Destroying a Session
---

```Session.instance.destroy


Browse Call Detail Records
---

call_data_records = CallDataRecord.where(:session_id => session_id,
                                         :account_id => account_id,
                                         :start_at => start_date_time,
                                         :end_at => end_date_time,
                                         :order_by => :date_time,
                                         :limit => )

call_data_record.count = CallDataRecord.count(:session_id => session_id,
                                         :account_id => account_id,
                                         :start_at => start_date_time,
                                         :end_at => end_date_time
                                         )





## Contributing

1. Fork it ( https://github.com/[my-github-username]/onsip/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
