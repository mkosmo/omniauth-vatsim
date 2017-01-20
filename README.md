# OmniAuth VATSIM

OmniAuth::Strategies::Vatsim is an OmniAuth strategy for authenticating with 
the VATSIM SSO with OAuth1.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'omniauth-vatsim'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install omniauth-vatsim

## Usage

Add the strategy to your ```Gemfile```:

```ruby
gem 'omniauth-vatsim'
```

Or you can pull it directly from github:

```ruby
gem 'omniauth-vatsim', git: 'https://github.com/jvoss/omniauth-vatsim.git'
```

For a Rails application you can now create an initializer ```config/initializers/omniauth.rb```:

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :vatsim, 'app_id', 'app_secret', site: 'https://cert.vatsim.net/sso'
end
```

For a Rails application using [Devise](https://github.com/plataformatec/devise), modify ```config/initializers/devise.rb```:

```ruby
config.omniauth :vatsim, 'app_id', 'app_secret', client_options: {site: 'https://cert.vatsim.net/sso'}
```

For Sinatra you would add:

```ruby
use Rack::Session::Cookie
use OmniAuth::Builder do
  provider :vatsim, 'api_id', 'api_secret', site: 'https://cert.vatsim.net/sso'
end
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/jvoss/omniauth-vatsim.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
