require File.expand_path 'test_helper', File.dirname(__FILE__)

class TestSkypeError < MiniTest::Test

  def test_error
    begin
      Skype.asdfhujiko
    rescue => e
      assert_equal e.class, Skype::Error
    end
  end

end
