require File.expand_path 'test_helper', File.dirname(__FILE__)

class TestSkypeChat < MiniTest::Test

  SKYPE_FROM = ENV["SKYPE_FROM"]
  SKYPE_TO   = ENV["SKYPE_TO"] || "echo123"

  def test_exec
    body = "hello exec"
    msg = Skype.exec "MESSAGE #{SKYPE_TO} #{body}"
    assert_equal msg.body, body
    assert_equal msg.time.class, Time
    assert_equal msg.user, SKYPE_FROM
  end

  def test_message
    body = "hello hello"
    msg = Skype.message SKYPE_TO, body
    assert_equal msg.body, body
    assert_equal msg.time.class, Time
    assert_equal msg.user, SKYPE_FROM
  end

  def test_message_escape
    body = "hello \"'$@&()^![]{};*?<>`\\ world"
    msg = Skype.message SKYPE_TO, body
    assert_equal msg.body, body
    assert_equal msg.time.class, Time
    assert_equal msg.user, SKYPE_FROM
  end

  def test_chats
    chat = Skype.chats[0]
    assert_equal chat.class, Skype::Chat
    assert_equal chat.topic.class, String
    assert_equal chat.members.class, Array
    assert_equal !chat.members.empty?, true
  end
end
