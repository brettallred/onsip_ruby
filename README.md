# Onsip

Ruby gem that wraps the Onsip Admin API

http://developer.onsip.com/admin-api/

## Installation

Add this line to your application's Gemfile:

    gem 'onsip'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install onsip

## Usage


### Authentication 
http://developer.onsip.com/admin-api/Authentication/#sessioncreate

Creating a Session
---

session = Session.new(
session_id = session.authenticate("username", "password")


session.destroy


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
