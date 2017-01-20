# OmniAuth VATSIM

OmniAuth::Strategies::Vatsim is an OmniAuth strategy for authenticating with 
the VATSIM SSO with OAuth1.

Note: Currently only supports HMAC-SHA1 authentication

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

## Sample Auth Hash

```
{
  "provider"=>"vatsim",
  "uid"=>"1300011",
  "info"=>{
    "id"=>"1300011",
    "name_first"=>"11th",
    "name_last"=>"Test",
    "rating"=>{
      "id"=>"11", 
      "short"=>"SUP", 
      "long"=>"Supervisor", 
      "GRP"=>"Supervisor"
    },
    "pilot_rating"=>{
      "rating"=>"22",
      "2"=>{
        "id"=>2, 
        "short"=>"P2", 
        "long"=>"Flight Fundamentals"
      },
      "4"=>{
        "id"=>4,
        "short"=>"P3",
        "long"=>"VFR Pilot"
      },
      "16"=>{
        "id"=>16, 
        "short"=>"P5", 
        "long"=>"Advanced IFR Pilot"
       }
     },
     "email"=>"noreply@vatsim.net",
     "experience"=>"N",
     "reg_date"=>"2014-05-14 17:17:26",
     "country"=>{
       "code"=>"GB", "name"=>"United Kingdom"
     },
     "region"=>{
       "code"=>"EUR", "name"=>"Europe"
     },
     "division"=>{
       "code"=>"GBR", "name"=>"United Kingdom"
     },
     "subdivision"=>{
       "code"=>nil, "name"=>nil
     }
   }
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/jvoss/omniauth-vatsim.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
