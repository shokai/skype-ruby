require File.expand_path 'test_helper', File.dirname(__FILE__)

class TestEnvVariables < MiniTest::Test

  def test_env_var
    assert ENV.has_key?("SKYPE_FROM"), "ENV variable SKYPE_FROM must not be empty"
    assert ENV.has_key?("SKYPE_TO"),   "ENV variable SKYPE_TO must not be empty"
  end

end
