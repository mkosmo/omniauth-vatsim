require "spec_helper"

RSpec.configure do |config|
  config.include WebMock::API
  config.include Rack::Test::Methods
  config.extend OmniAuth::Test::StrategyMacros, :type => :strategy
end

describe OmniAuth::Strategies::Vatsim do
  def app
    Rack::Builder.new {
      use OmniAuth::Test::PhonySession
      use OmniAuth::Builder do
        provider :vatsim
      end
      run lambda { |env| [404, {'Content-Type' => 'text/plain'}, [env.key?(omniauth.auth).to_s]] }
    }.to_app
  end

  def session
    last_request.env['rack.session']
  end

  describe '/auth/vatsim' do
    context 'successful' do
      it 'should connect to test sso server' do
        stub_request(:post, 'http://sso.hardern.net/server/').
            to_return(status: [200, 'OK'])
      end
    end
    context 'unsuccessful' do
      it 'should return invalid consumer key' do
        stub_request(:post, 'http://sso.hardern.net/server/api/login_token').
            to_return(:body => '{"request":{"result":"fail","message":"Invalid consumer key"},"token":{"oauth_token":"","oauth_token_secret":"","oauth_callback_confirmed":""}}')
      end
    end
  end
end
