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

class FibberMailman
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
        pop_mails = @@raw_mails.map { |raw_mail| FibberPop.new( raw_mail ) }
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
