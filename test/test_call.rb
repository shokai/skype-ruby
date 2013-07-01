require File.expand_path 'test_helper', File.dirname(__FILE__)

class TestSkypeCall < MiniTest::Test

  SKYPE_FROM = ENV["SKYPE_FROM"]
  SKYPE_TO   = "echo123"

  def test_call
    call = Skype.call SKYPE_TO
    STDERR.puts call if call.kind_of? String
    assert_equal call.class, Skype::Call
    assert_equal call.to, SKYPE_TO
    while !call.talking?
      sleep 2
    end
    call.hangup
    assert [:finished, :missed, :cancelled].include? call.status
    assert_equal call.talking?, false
  end

end
