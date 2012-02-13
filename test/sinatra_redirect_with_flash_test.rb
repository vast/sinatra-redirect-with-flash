require 'rubygems'
require 'rack/test'
require 'sinatra_app'
require 'test/unit'

set :environment, :test

class SinatraRedirectWithFlashTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def flash
    last_request.env['x-rack.flash'] || last_request.env['rack.session']['flash']
  end

  def test_redirect_with_custom_flash_opts
    get '/'
    assert_not_nil flash
    assert_equal "sample info", flash[:info]
  end

  def test_common_flash_names
    Sinatra::RedirectWithFlash::COMMON_FLASH_NAMES.each do |k|
      get "/#{k.to_s}"
      assert_not_nil flash
      assert_equal "sample #{k.to_s}", flash[k]
    end
  end

  def test_redirect_with_code_and_flash
    get '/notice-with-code'
    assert_not_nil flash
    assert_equal flash[:notice], '301 and notice'

    assert_equal last_response.status, 301
    assert_equal last_response.body, ''
    assert last_response.headers['Location'] =~ /\/fff$/
  end

  def test_old_school_redirect
    get '/old-school-redirect'
    assert_equal last_response.status, 302
    assert_equal last_response.body, ''
    assert last_response.headers['Location'] =~ /\/aaa$/
  end

  def test_old_school_redirect_with_code
    get '/old-school-redirect-with-code'
    assert_equal last_response.status, 301
    assert_equal last_response.body, ''
    assert last_response.headers['Location'] =~ /\/aaa$/
  end

end