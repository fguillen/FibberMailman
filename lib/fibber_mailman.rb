require 'net/pop'

class FibberPop
  def initialize( raw_mail)
    @raw_mail = raw_mail
  end
  
  def pop
    return @raw_mail
  end
  
  def method_missing(m, *args, &block)  
    puts "PopMock.#{m} called"  
  end
end

#
# Example of use:
#     raw_mails = [
#       File.read( "/fixtures/mail1.raw_mail" ) ),
#       File.read( "/fixtures/mail2.raw_mail" ) ),
#     ]
#     
#     FibberMailman.lie_to_me( raw_mails ) do
#       <your code that uses the Net::POP3.start on any point>
#     end
#     
# Not any real POP call will be done.
# 
# The mock will simulate that the mails received was the fake **raw_mails**.
#
class FibberMailman
  def self.raw_mails
    @@raw_mails
  end
  
  def self.lie_to_me( raw_mails )
    @@raw_mails = raw_mails
    
    # mocking
    Net::POP3.class_eval do
      alias_method :orig_start, :start
      def start( *, &block )
        block.call( self )
      end
      
      alias_method :orig_mails, :mails
      def mails
        pop_mails = FibberMailman.raw_mails.map { |raw_mail| FibberPop.new( raw_mail ) }
        return pop_mails
      end
    end
    
    begin
      yield
    ensure
      
      # unmocking
      Net::POP3.class_eval do
        alias_method :start, :orig_start
        alias_method :mails, :orig_mails
      end
    end
  end

end
