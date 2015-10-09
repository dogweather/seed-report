# SeedReport

## The Deliverable
A readable summary of your Rails seed results.

![seed-report](https://cloud.githubusercontent.com/assets/150670/10386234/4abc2098-6e09-11e5-909e-b538391de1d7.png)


**Step 1.** Place your `create`'s and `save`'s in a request for a seed report:

```ruby
SeedReport.for_model Model_class do
  # A block which creates the Model_class seed instances.
end
```

For example:

```ruby
SeedReport.for_model Country do
  Country.find_or_create_by!(
    name:        'United States',
    alpha_2:     'us',
    alpha_3:     'usa',
    region_meta_name: 'state'
  )
end

SeedReport.for_model Region do
  us = Country.find_by! alpha_2: 'us'

  Region.find_or_create_by!(
    name:    'California',
    slug:    'ca',
    country:  us
  )
  Region.find_or_create_by!(
    name:    'Nevada',
    slug:    'nv',
    country:  us
  )
end

# etc.
```

**Step 2.** Run your seeds with `rake db:reset` (my favorite), `rake db:setup`,
or `rake db:seed`.

**Step 3.** Enjoy the simple summary output.


## Installation

Add this line to your Rails application's Gemfile:

```ruby
gem 'seed_report', group: :development
```

And then execute:

    $ bundle

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/dogweather/seed_report.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
