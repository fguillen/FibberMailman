require 'rubygems'
require 'net/pop'
require 'test/unit'
require 'tmail'
require File.dirname(__FILE__) + "/../lib/fibber_mailman"

class FibberMailmanTest < Test::Unit::TestCase
  def test_mocking
    raw_mails = [
      "raw_mail 1",
      "raw_mail 2",
    ]

    mails = []    
    FibberMailman.lie_to_me( raw_mails ) do
      Net::POP3.start( 'server', 'port', 'user', 'pass' ) do |pop|
        pop.each_mail do |mail|
          mails << mail.pop
        end
      end
    end
    
    assert_equal( ["raw_mail 1", "raw_mail 2"], mails )
  end
end