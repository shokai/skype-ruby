require File.expand_path 'test_helper', File.dirname(__FILE__)

class TestSkype < MiniTest::Test

  def test_username
    res = Skype.exec "GET USER echo123 FULLNAME"
    assert res =~ /Sound Test Service/i, "API response error"
  end

end
