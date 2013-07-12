require File.expand_path 'test_helper', File.dirname(__FILE__)

class TestSkypeError < MiniTest::Test

  def test_api_error
    begin
      Skype.asdfhujiko
    rescue => e
      err = e
    end
    assert_equal err.class, Skype::APIError
    assert err.message =~ /^ERROR /
  end

end
