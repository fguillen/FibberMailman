require 'rubygems'
require 'net/pop'
require 'test/unit'
require 'tmail'
require File.dirname(__FILE__) + "/../lib/fibber_mailman"

class FibberMailmanTest < Test::Unit::TestCase
  def test_mocking
    raw_mails = [
      File.read( File.dirname(__FILE__) + "/fixtures/mail1.raw_mail" ),
      File.read( File.dirname(__FILE__) + "/fixtures/mail2.raw_mail" ),
    ]

    mails_subjects = []    
    FibberMailman.lie_to_me( raw_mails ) do
      Net::POP3.start( 'server', 'port', 'user', 'pass' ) do |pop|
        pop.each_mail do |mail|
          tmail = TMail::Mail.parse( mail.pop )
          mails_subjects << tmail.subject
        end
      end
    end
    
    assert_equal( ['test 1', 'test 2'], mails_subjects )
  end
end